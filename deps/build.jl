using BinDeps
import Compat: Libdl, Sys

@BinDeps.setup

pg_query = library_dependency("pg_query", aliases = ["pg_query", "libpg_query"])
deps = [ pg_query ]

depsdir = BinDeps.depsdir(first(deps))
prefix = joinpath(depsdir, "usr")

@static if Sys.iswindows()
    bindir = joinpath(prefix, "bin")
else
    bindir = joinpath(prefix, "lib")
end

srcdir = joinpath(depsdir, "src")
pg_query_srcdir = joinpath(srcdir, "libpg_query")
pg_query_builddir = pg_query_srcdir

lib_prefix = @static Sys.iswindows() ? "" : "lib"
lib_suffix = @static Sys.iswindows() ? "dll" : (@static Sys.isapple() ? "dylib" : "so")

lib_file_name(l) = "$(lib_prefix)$(string(l)).$lib_suffix"

lib_labels = [:pg_query]
deps_paths = AbstractString[]
for l in lib_labels
  push!(deps_paths, joinpath(bindir, lib_file_name(l)))
end

build_c_steps = @build_steps begin
  `rm -rf $pg_query_builddir`
  `git clone -b 10-latest git://github.com/RelationalAI-oss/libpg_query`
  @build_steps begin
    ChangeDirectory(pg_query_builddir)
    `make`
    `mkdir -p $bindir`
    `cp ./$(lib_file_name(lib_labels[1])) $bindir/`
  end
end

# If built, always run make, in case the code changed
if isdir(pg_query_builddir)
  BinDeps.run(@build_steps begin
    ChangeDirectory(srcdir)
    build_c_steps
  end)
end

provides(BuildProcess,
  (@build_steps begin
    CreateDirectory(srcdir)
    @build_steps begin
      ChangeDirectory(srcdir)
      build_c_steps
      for l in lib_labels
          Libdl.dlopen_e(joinpath(bindir, "$(lib_prefix)$(string(l)).$lib_suffix"), Libdl.RTLD_LAZY)
      end
    end
  end), deps)

@BinDeps.install Dict([(:pg_query, :_l_pg_query)])
