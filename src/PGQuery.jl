module PGQuery

import Libdl
import JSON: parse
using AbstractTrees

const LONG_MAX = Base.typemin(Int32)
const AttrNumber = Int16
const FdwRoutine = Cvoid
const BlockNumber = UInt32
const HTAB = Cvoid
const OffsetNumber = UInt16
const MemoryContext = Ptr{Cvoid} # Ptr{MemoryContextData}
const PLpgSQL_function = Cvoid
const bool = Cuchar
const TupleTableSlot = Cvoid
const dsa_area = Cvoid
const dsa_pointer = Ptr{Cvoid} # UInt64
const ItemPointer = Ptr{Cvoid} # UInt64
const int8 = UInt8
const uint8 = UInt8
const int16 = UInt16
const uint16 = UInt16
const int32 = Int32
const uint32 = UInt32
const bits8 = uint8
const bits16 = uint16
const bits32 = uint32
const Size = UInt64
const Index = uint32
const Offset = int32
const UINT_MAX = Base.typemax(UInt64)
const Datum = UInt64
#=
union ValUnion
{
    long        ival;       /* machine integer */
    char       *str;        /* string */
}           val;
=#
const ValUnion = Ptr{Cvoid}

# struct ANONYMOUS1_data
#     #=
#     union
#     {
#         void       *ptr_value;
#         int         int_value;
#         Oid         oid_value;
#     }           data;
#     =#
#     ptr_value::Ptr{Cvoid} # Union{Ptr{List}, Cint, Oid=Cint}
# end

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

include(joinpath(@__DIR__, "gen", "libpg_common.jl"))
include(joinpath(@__DIR__, "gen", "libpg_api.jl"))

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
