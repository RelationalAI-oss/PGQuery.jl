module PGQueryTests

using AbstractTrees
using PGQuery
using Test

@testset "simple SQL parsing" begin
    parse_query("SELECT 1") do parsed_qry
        AbstractTrees.print_tree(parsed_qry)
    end
    @test_throws SQLParserException parse_query("INSERT FROM DOES NOT WORK")
end

end
