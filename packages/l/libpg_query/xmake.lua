package("libpg_query")
    set_description("C library for accessing the PostgreSQL parser outside of the server")

    set_urls("https://github.com/plutolove/libpg_query/archive/refs/tags/$(version).tar.gz",
                 "https://github.com/plutolove/libpg_query.git")

    add_versions("12.1.0", "6d020f6eb22b5390dc9eddfd68382232249cf4cdf9446b4b4261019cd801def4")
    add_versions("duckdb_parser-1.1.3", "06fc8b1fc2ee0869a5c6eea73ee717e6ae84e26efeaab15af3e22f3ce6817664")
    on_install("macosx", "linux", function (package)
        local configs = {
            "-DCMAKE_BUILD_TYPE=Release"
        }
        import("package.tools.cmake").install(package, configs)
    end)
