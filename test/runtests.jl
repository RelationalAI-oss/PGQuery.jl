module PGQueryTests

using PGQuery
using Test

@test parse_sql("SELECT 1") isa Dict{String, Any}

@test_throws ErrorException parse_sql("SELEC 1")

end
