package("libpg_query")
    set_description("C library for accessing the PostgreSQL parser outside of the server")

    set_urls("https://github.com/plutolove/libpg_query/archive/refs/tags/$(version).tar.gz",
                 "https://github.com/plutolove/libpg_query.git")

    add_versions("12.1.0", "6d020f6eb22b5390dc9eddfd68382232249cf4cdf9446b4b4261019cd801def4")
    add_versions("duckdb_parser-1.1.3", "11c5228c26e9d2554d19e4925b544c4ec47e7e871b39f754a933f13adc90ca9b")
    on_install("macosx", "linux", function (package)
        local configs = {
            "-DCMAKE_BUILD_TYPE=Release"
        }
        import("package.tools.cmake").install(package, configs)
    end)
