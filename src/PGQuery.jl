module PGQuery

import Libdl
import JSON: parse

# Load in `deps.jl`, complaining if it does not exist
const depsjl_path = joinpath(@__DIR__, "..", "deps", "deps.jl")
if !isfile(depsjl_path)
    error("PGQuery was not build properly. Please run Pkg.build(\"PGQuery\").")
end

# Module initialization function
function __init__()
    include(depsjl_path)
end

include(joinpath(@__DIR__, "gen", "CEnum.jl"))
using .CEnum

include(joinpath(@__DIR__, "gen", "ctypes.jl"))
export Ctm, Ctime_t, Cclock_t

include(joinpath(@__DIR__, "gen", "libpg_common.jl"))
include(joinpath(@__DIR__, "gen", "libpg_api.jl"))

# export everything with "pg_query_" prefix
foreach(names(@__MODULE__, all=true)) do s
   if startswith(string(s), "pg_query_")
       @eval export $s
   end
end

function parse_sql_select(input)
    parsed_res = pg_query_parse(input)
    if parsed_res.error == C_NULL
        parse_tree = unsafe_string(parsed_res.parse_tree)
        json_parse_tree = parse(parse_tree)
        @assert length(json_parse_tree) == 1
        first_exp = json_parse_tree[1]
        @assert length(first_exp) == 1
        @assert haskey(first_exp, "RawStmt")
        raw_stmt = first_exp["RawStmt"]
        @assert haskey(raw_stmt, "stmt")
        stmt = raw_stmt["stmt"]
        @assert haskey(stmt, "SelectStmt")
        return stmt["SelectStmt"]
    else
        throw(error(unsafe_string(unsafe_load(parsed_res.error).message)))
    end
end

parse_sql(input) = parse_sql_select(input)

export parse_sql, parse_sql_select

end # module
