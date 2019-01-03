# Julia wrapper for header: /Users/dashti/Dropbox/workspaces/RelationalAI/libpg_query/src/pg_query_fingerprint.h
# Automatically generated using Clang.jl wrap_c


function pg_query_fingerprint_with_opts()
    ccall((:pg_query_fingerprint_with_opts, libpg_query), Cint, ())
end
# Julia wrapper for header: /Users/dashti/Dropbox/workspaces/RelationalAI/libpg_query/src/pg_query_internal.h
# Automatically generated using Clang.jl wrap_c


function pg_query_raw_parse(input)
    ccall((:pg_query_raw_parse, libpg_query), PgQueryInternalParsetreeAndError, (Cstring,), input)
end

function pg_query_free_error(error)
    ccall((:pg_query_free_error, libpg_query), Cvoid, (Ptr{Cint},), error)
end

function pg_query_enter_memory_context()
    ccall((:pg_query_enter_memory_context, libpg_query), Cint, ())
end

function pg_query_exit_memory_context(ctx)
    ccall((:pg_query_exit_memory_context, libpg_query), Cvoid, (Cint,), ctx)
end
# Julia wrapper for header: /Users/dashti/Dropbox/workspaces/RelationalAI/libpg_query/src/pg_query_json.h
# Automatically generated using Clang.jl wrap_c


function pg_query_nodes_to_json(obj)
    ccall((:pg_query_nodes_to_json, libpg_query), Cstring, (Ptr{Cvoid},), obj)
end
# Julia wrapper for header: /Users/dashti/Dropbox/workspaces/RelationalAI/libpg_query/src/pg_query_json_plpgsql.h
# Automatically generated using Clang.jl wrap_c


function plpgsqlToJSON(func)
    ccall((:plpgsqlToJSON, libpg_query), Cstring, (Ptr{Cint},), func)
end
# Julia wrapper for header: /Users/dashti/Dropbox/workspaces/RelationalAI/libpg_query//pg_query.h
# Automatically generated using Clang.jl wrap_c


function pg_query_normalize(input)
    ccall((:pg_query_normalize, libpg_query), PgQueryNormalizeResult, (Cstring,), input)
end

function pg_query_parse(input)
    ccall((:pg_query_parse, libpg_query), PgQueryParseResult, (Cstring,), input)
end

function pg_query_parse_plpgsql(input)
    ccall((:pg_query_parse_plpgsql, libpg_query), PgQueryPlpgsqlParseResult, (Cstring,), input)
end

function pg_query_fingerprint(input)
    ccall((:pg_query_fingerprint, libpg_query), PgQueryFingerprintResult, (Cstring,), input)
end

function pg_query_free_normalize_result(result)
    ccall((:pg_query_free_normalize_result, libpg_query), Cvoid, (PgQueryNormalizeResult,), result)
end

function pg_query_free_parse_result(result)
    ccall((:pg_query_free_parse_result, libpg_query), Cvoid, (PgQueryParseResult,), result)
end

function pg_query_free_plpgsql_parse_result(result)
    ccall((:pg_query_free_plpgsql_parse_result, libpg_query), Cvoid, (PgQueryPlpgsqlParseResult,), result)
end

function pg_query_free_fingerprint_result(result)
    ccall((:pg_query_free_fingerprint_result, libpg_query), Cvoid, (PgQueryFingerprintResult,), result)
end

function pg_query_init()
    ccall((:pg_query_init, libpg_query), Cvoid, ())
end
