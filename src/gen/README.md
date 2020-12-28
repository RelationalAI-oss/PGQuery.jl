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
# using Julia 1.5.3 and Clang.jl v0.12.1
include("codegen.jl")
```

3- Apply `codegen-patch.diff` on the generated code.

4- Include the above wrapper and then you should be able to run this:

```
julia> x  = pg_query_parse("SELECT 1")
>> PgQueryParseResult(Cstring(0x00007f9b6384fec0), Cstring(0x00007f9b63892db0), Ptr{PgQueryError} @0x0000000000000000)

julia> print(unsafe_string(x.parse_tree))
[{"RawStmt": {"stmt": {"SelectStmt": {"targetList": [{"ResTarget": {"val": {"A_Const": {"val": {"Integer": {"ival": 1}}, "location": 7}}, "location": 7}}], "op": 0}}}}]
```
