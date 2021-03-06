module PGQuery

import Libdl
import JSON: parse
using AbstractTrees

# Load in `deps.jl`, complaining if it does not exist
const depsjl_path = joinpath(@__DIR__, "..", "deps", "deps.jl")
if !isfile(depsjl_path)
    error("PGQuery was not build properly. Please run Pkg.build(\"PGQuery\").")
end

# Module initialization function
function __init__()
    include(depsjl_path)
end

using CEnum

include(joinpath(@__DIR__, "gen", "ctypes.jl"))
export Ctm, Ctime_t, Cclock_t

include(joinpath(@__DIR__, "gencode_type_ext.jl"))

include(joinpath(@__DIR__, "gen", "libpg_common.jl"))
include(joinpath(@__DIR__, "gen", "libpg_api.jl"))

include(joinpath(@__DIR__, "gencode_ext.jl"))
include(joinpath(@__DIR__, "abstract_trees.jl"))
include(joinpath(@__DIR__, "exceptions.jl"))

function parse_query(query_str)
    parse_query(parsed_qry -> nothing, query_str)
end

function parse_query(consumer::Function, query_str)
    ctx = pg_query_enter_memory_context("pg_query_parse")
    try
        res::PgQueryInternalParsetreeAndError = pg_query_raw_parse(query_str)

        if(res.error != C_NULL)
            throw(SQLParserException(res.error))
        elseif res.tree  == C_NULL
            throw(SQLParserNoParseTreeException())
        end

        return consumer(unsafe_load(res.tree))
    finally
        pg_query_exit_memory_context(ctx)
    end
end

function parse_query_json(query_str)
    parse_query_json(parsed_qry -> nothing, query_str)
end

function parse_query_json(consumer::Function, query_str)
    res::PgQueryParseResult = pg_query_parse(query_str)

    if res.error != C_NULL
        throw(SQLParserException(res.error))
    else
        consumer(convert_cstring_to_str(res.parse_tree))
    end
end

# export everything with "pg_query_" prefix
foreach(names(@__MODULE__, all=true)) do s
   if startswith(string(s), "pg_query_")
       @eval export $s
   end
end

export SQLParserNoParseTreeException, SQLParserException, parse_query, parse_query_json

end # module
