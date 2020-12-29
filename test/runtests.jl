module PGQueryTests

using AbstractTrees
using JSON
using PGQuery
using Test

function try_query(qry)
    println("query:")
    println(qry)
    parse_query_json(qry) do parsed_qry_json_str
        parsed_qry_json = JSON.parse(parsed_qry_json_str)
        println("parsed_qry_json:")
        JSON.print(parsed_qry_json, 2)
    end
    parse_query(qry) do parsed_qry
        AbstractTrees.print_tree(parsed_qry, 999)
    end
    println("-----------------------------------------------")
end

function sql_files(dir)
    [file for file in readdir(dir) if endswith(file, ".sql")]
end

@testset "simple SQL parsing" begin
    try_query("SELECT 1")
    try_query("SELECT 'abc'")
    try_query("SELECT 3.14")
    try_query("SELECT a from tbl")
    for imdb_job_qry in sql_files(joinpath(@__DIR__, "imdb_job"))
        try_query(read(joinpath(@__DIR__, "imdb_job", imdb_job_qry), String))
    end
    for tpch_qry in sql_files(joinpath(@__DIR__, "tpch"))
        try_query(read(joinpath(@__DIR__, "tpch", tpch_qry), String))
    end
    @test_throws SQLParserException parse_query("INSERT FROM DOES NOT WORK")
end

end
