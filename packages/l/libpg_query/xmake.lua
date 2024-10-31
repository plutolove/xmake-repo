package("libpg_query")
    set_description("C library for accessing the PostgreSQL parser outside of the server")

    set_urls("https://github.com/pganalyze/libpg_query/archive/refs/tags/$(version).tar.gz",
                 "https://github.com/pganalyze/libpg_query.git")

    add_versions("16-5.1.0", "31f25b573da1c966bc762b0313b0a50cdd03aabdbaf666d90469eddcb1656df7")
    add_versions("15-4.2.4", "d0ace0bff40e5daa99e32753a22a7558f9b2207e89260f00171fc50723b831dd")
    add_versions("14-3.0.0", "59c5cd6d41e36e3f5c9d1179b40190c5429045e211a29527e8500f93a9a75f78")
    add_versions("13-2.2.0", "07916be1a2b780dee6feed936aaa04ccee2a3afde8570a6920c3a839c87539c6")
    add_versions("10-1.0.5", "b96ac0d09eecde3cfd2bb5cb0e7a251aab2ae9a2fe8be54ce83c973f20b6cb12")

    on_install("macosx", "linux", function (package)
        os.vrun("make install prefix=%s", package:installdir())
        os.rm(package:installdir("lib/*.so*"))
    end)
