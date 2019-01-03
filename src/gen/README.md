# Generating the wrapper for `libpg_query`

These are the steps to re-generate the wrapper:

1- Download and make `libpg_query`

```
git clone -b 10-latest git://github.com/RelationalAI-oss/libpg_query
cd libpg_query
make
```

2- Generate the Julia wrapper:

```
# you need to first add Clang.jl package
using Clang
# LIBCLANG_HEADERS are those headers to be wrapped.
const LIBCLANG_INCLUDE = joinpath("/Users/dashti/Dropbox/workspaces/RelationalAI/libpg_query/src")
const LIBCLANG_HEADERS = [joinpath(LIBCLANG_INCLUDE, header) for header in readdir(LIBCLANG_INCLUDE) if endswith(header, ".h")]
push!(LIBCLANG_HEADERS, "$(@__DIR__)/pg_query.h")
wc = init(; headers = LIBCLANG_HEADERS,
            output_file = joinpath(@__DIR__, "libpg_api.jl"),
            common_file = joinpath(@__DIR__, "libpg_common.jl"),
            #clang_includes = vcat(LIBCLANG_INCLUDE, CLANG_INCLUDE),
            clang_includes = [LIBCLANG_INCLUDE],
            clang_args = ["-I", joinpath(LIBCLANG_INCLUDE, "..")],
            header_wrapped = (root, current)->root == current,
            header_library = x->"libpg_query",
            clang_diagnostics = true,
            )
run(wc)
```

3- Include the above wrapper and then you should be able to run this:

```
julia> x  = pg_query_parse("SELECT 1")
>> PgQueryParseResult(Cstring(0x00007f9b6384fec0), Cstring(0x00007f9b63892db0), Ptr{PgQueryError} @0x0000000000000000)

julia> print(unsafe_string(x.parse_tree))
[{"RawStmt": {"stmt": {"SelectStmt": {"targetList": [{"ResTarget": {"val": {"A_Const": {"val": {"Integer": {"ival": 1}}, "location": 7}}, "location": 7}}], "op": 0}}}}]
```