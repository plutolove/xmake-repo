package("pg_query")
    set_description("C library for accessing the PostgreSQL parser outside of the server")

    set_urls("https://github.com/plutolove/libpg_query/archive/refs/tags/$(version).tar.gz",
                 "https://github.com/plutolove/libpg_query.git")

    add_versions("16-5.1.0", "31f25b573da1c966bc762b0313b0a50cdd03aabdbaf666d90469eddcb1656df7")
    add_versions("16.0", "ed15fc3485852739eed313c4462b22c5285318b20d5d4cbb1b5042fa3f0eb2c7")

    on_install("macosx", "linux", function (package)
        local configs = {}
        configs.prefix = package:installdir()
        import("package.tools.make").install(package)
    end)
