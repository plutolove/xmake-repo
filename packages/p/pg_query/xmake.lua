package("pg_query")
    set_description("C library for accessing the PostgreSQL parser outside of the server")

    set_urls("https://github.com/xmake-mirror/7zip/archive/refs/tags/$(version).tar.gz",
                 "https://github.com/pganalyze/libpg_query.git")

    add_versions("16-5.1.0", "31f25b573da1c966bc762b0313b0a50cdd03aabdbaf666d90469eddcb1656df7")

    on_install("macosx", "linux", function (package)
        import("package.tools.make").install(package)
    end)
