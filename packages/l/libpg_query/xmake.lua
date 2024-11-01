package("libpg_query")
    set_description("C library for accessing the PostgreSQL parser outside of the server")

    set_urls("https://github.com/plutolove/libpg_query/archive/refs/tags/$(version).tar.gz",
                 "https://github.com/plutolove/libpg_query.git")

    add_versions("12-0", "d91f7e74fb860d1590e9502d7baa83439d13600b9cc8a93d6b1318b359f18830")
    add_versions("12.1.0", "6d020f6eb22b5390dc9eddfd68382232249cf4cdf9446b4b4261019cd801def4")
    on_install("macosx", "linux", function (package)
        local configs = {
            "-DCMAKE_BUILD_TYPE=Release"
        }
        import("package.tools.cmake").install(package, configs)
    end)
