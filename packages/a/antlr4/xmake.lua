package("antlr4")
    set_homepage("https://www.antlr.org/")
    set_description("C++ Common Libraries")
    set_license("BSD 3-Clause")

    add_urls("https://github.com/plutolove/antlr4_cpp/archive/refs/tags/$(version).tar.gz", 
             "https://github.com/plutolove/antlr4_cpp")
    add_versions("v4.12.0", "161690afbc968846ea28e04e27f501895f9353278ef34108c58c31849571de9b")
    add_deps("cmake")
    add_links("libantlr4-runtime")
    on_install("macosx", "linux", "windows", function (package)
        local configs = {"-DANTLR_BUILD_CPP_TESTS=OFF"}
        import("package.tools.cmake").install(package, configs, {buildir = os.tmpfile() .. ".dir"})
        os.rm(package:installdir("include/gmock"))
        os.rm(package:installdir("include/gtest"))
        os.rm(package:installdir("lib/libg*"))
    end)
