package("antlr4")
    set_homepage("https://www.antlr.org/")
    set_description("C++ Common Libraries")
    set_license("BSD 3-Clause")

    add_urls("https://github.com/plutolove/antlr4_cpp/archive/refs/tags/$(version).tar.gz", 
             "https://github.com/plutolove/antlr4_cpp")
    add_versions("v4.12.0", "a3bc0ce53dbdb0b72edab7143273defc18481aab285d2a57375eb2a041fece43")
    add_deps("cmake")
    add_links("libantlr4-runtime")
    on_install("macosx", "linux", "windows", function (package)
        import("package.tools.cmake").install(package, configs, {buildir = os.tmpfile() .. ".dir"})
    end)
