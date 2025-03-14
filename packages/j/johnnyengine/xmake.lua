package("johnnyengine")
    set_homepage("https://github.com/PucklaJ/JohnnyEngine")
    set_description("A 2D/3D Engine using OpenGL and SDL for input and the window")
    set_license("zlib")

    add_urls("https://github.com/PucklaJ/JohnnyEngine/archive/refs/tags/$(version).zip",
            "https://github.com/PucklaJ/JohnnyEngine.git")
    add_versions("1.0.1", "53c11b827bea6fe30f9bca27adbd712eec85a0853c0402407930bae78ad54a8f")
    add_patches("1.0.1", path.join(os.scriptdir(), "patches", "1.0.1", "win32_shared_fix.patch"), "fbe22cb5a9f0485982c7755936d14de6da3ce80a42394d48946b14b922847611")

    add_deps("glew", "libsdl2", "libsdl2_ttf", "libsdl2_mixer", "libsdl2_gfx", "box2d 2.x", "assimp", "stb", "tmxparser")

    if is_plat("macosx") then
        add_frameworks("OpenGL")
    end

    on_install("windows|x86", "windows|x64", "linux", "macosx", function (package)
        io.writefile("xmake.lua", [[
set_project("johnny-engine")

add_requires("glew", "libsdl2", "libsdl2_ttf", "libsdl2_mixer", "libsdl2_gfx", "box2d 2.x", "assimp", "stb", "tmxparser")

add_rules("mode.debug", "mode.release")
target("johnny-engine")
    set_kind("$(kind)")
    add_defines("STB_IMAGE_IMPLEMENTATION")
    set_languages("c++11")

    add_packages("glew", "libsdl2", "libsdl2_ttf", "libsdl2_mixer", "libsdl2_gfx", "box2d", "assimp", "stb", "tmxparser")

    if is_kind("shared") then
        add_rules("utils.symbols.export_all", {export_classes = true})
    end

    if is_plat("macosx") then
        add_frameworks("OpenGL")
    end

    add_files("src/*.cpp")
    add_headerfiles("include/*.h")
    add_includedirs("include")
        ]])
        import("package.tools.xmake").install(package, {kind = (package:config("shared") and "shared" or "static")})
    end)

    on_test(function (package)
        assert(package:check_cxxsnippets({test = [[
        using namespace Johnny;

        class Game : public MainClass {
        public:
          Game() {}
          ~Game() {}

          bool init() override { return true; }
          bool update() override { return true; }
          bool render() override { return true; }
          void quit() override {}
        };

        void test(int argc, char** argv) {
          Vector2<double> v2(1.0, 2.0);
          auto m4(Matrix4<float>::identity());
          Rectangle<int> r(1, 2, 3, 4);
          Game().run();
        }
        ]]}, {configs = {defines = "SDL_MAIN_HANDLED", languages = "cxx11"}, includes = "Johnny.h"}))
    end)
