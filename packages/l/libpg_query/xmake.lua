package("libpg_query")
    set_description("C library for accessing the PostgreSQL parser outside of the server")

    set_urls("https://github.com/plutolove/libpg_query/archive/refs/tags/$(version).tar.gz",
                 "https://github.com/plutolove/libpg_query.git")

    add_versions("12-0", "d91f7e74fb860d1590e9502d7baa83439d13600b9cc8a93d6b1318b359f18830")

    on_install("macosx", "linux", function (package)
        local configs = {
            "-DCMAKE_BUILD_TYPE=Release"
        }
        import("package.tools.cmake").install(package, configs)
    end)
