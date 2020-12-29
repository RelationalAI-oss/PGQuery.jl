# you need to first add Clang.jl package
using Clang
# LIBCLANG_HEADERS are those headers to be wrapped.
const LIBCLANG_INCLUDE = joinpath(@__DIR__, "src")
const LIBCLANG_HEADERS = vcat(
    [
        "$(@__DIR__)/pg_query.h",
        joinpath(LIBCLANG_INCLUDE, "postgres", "include", "access", "sdir.h"),
        joinpath(LIBCLANG_INCLUDE, "postgres", "include", "postgres_ext.h"),
    ],
    [joinpath(LIBCLANG_INCLUDE, header) for header in readdir(LIBCLANG_INCLUDE) if endswith(header, ".h")],
    [joinpath(LIBCLANG_INCLUDE, "postgres", "include", "nodes", header) for header in readdir(joinpath(LIBCLANG_INCLUDE, "postgres", "include", "nodes")) if endswith(header, ".h") && !(header in ["execnodes.h"])],
)
wc = init(; headers = LIBCLANG_HEADERS,
            output_file = joinpath(@__DIR__, "libpg_api.jl"),
            common_file = joinpath(@__DIR__, "libpg_common.jl"),
            clang_includes = vcat(
                LIBCLANG_INCLUDE,
                CLANG_INCLUDE,
                joinpath(LIBCLANG_INCLUDE, "postgres", "include"),
            ),
            #clang_includes = [LIBCLANG_INCLUDE],
            clang_args = ["-I", joinpath(LIBCLANG_INCLUDE, "..")],
            header_wrapped = (root, current)->root == current,
            header_library = x->"libpg_query",
            clang_diagnostics = true,
            )
run(wc)
