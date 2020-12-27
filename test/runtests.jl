module PGQueryTests

using PGQuery
using PGQuery: PgQueryError, PgQueryInternalParsetreeAndError, PgQueryParseResult
using Test
using AbstractTrees

struct SQLParserNoParseTreeException <: Exception end

function Base.showerror(io::IO, ::SQLParserNoParseTreeException)
    print(io, "SQLParserNoParseTreeException")
end

struct SQLParserException <: Exception
    inner::Ptr{PgQueryError}
end

function Base.showerror(io::IO, pe::SQLParserException)
    err = unsafe_load(pe.inner)
    print(io, "SQLParserException: " * convert_cstring_to_str(err.message) *
        " at location " * string(err.cursorpos) * " (" * convert_cstring_to_str(err.funcname) *
        " in " * convert_cstring_to_str(err.filename) * ":" * string(err.lineno) * ")\n")
end

function convert_cstring_to_str(c_str)
    c_str == C_NULL ? "" : unsafe_string(c_str)
end

function parse_query(query_str)
    parse_query(parsed_qry -> nothing, query_str)
end

function convert_to_proper_node_type(node)
    node_type_enum = unsafe_load(convert(Ptr{PGQuery.Node}, node)).type
    node_type = convert_to_node_type(Val(node_type_enum))
    unsafe_load(convert(Ptr{node_type}, node))
end

function convert_to_node_type(::Val{T}) where T
    str_name = string(T)
    index1 = findfirst(isequal('_'), str_name) + 1
    index2 = findfirst(isequal('('), str_name) - 1
    type_name = SubString(str_name, index1, index2)
    return eval(Meta.parse("PGQuery.$type_name"))
end

AbstractTrees.printnode(io::IO, x::PGQuery.List) = print(io, string("List(",x.type,") with length=",x.length))

function AbstractTrees.children(x::PGQuery.List)
    @assert x.type == PGQuery.T_List
    children = []
    for i in 1:x.length
        listCell = unsafe_load(x.head, 1)
        push!(children, convert_to_proper_node_type(listCell.data))
    end
    return children
end

function parse_query(consumer::Function, query_str)
    @show query_str
    ctx = pg_query_enter_memory_context("pg_query_parse")
    try
        res::PgQueryInternalParsetreeAndError = pg_query_raw_parse(query_str)
        @show typeof(res)

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

@testset "simple SQL parsing" begin
    parse_query("SELECT 1") do parsed_qry
        AbstractTrees.print_tree(parsed_qry)
    end
    @test_throws SQLParserException parse_query("INSERT FROM DOES NOT WORK")
end

end
