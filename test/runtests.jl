module PGQueryTests

using PGQuery
using Test


ctx = pg_query_enter_memory_context("test_ctx")
pg_query_raw_parse("SELECT 1")
pg_query_exit_memory_context(ctx)

end
