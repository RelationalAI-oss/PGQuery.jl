# Automatically generated using Clang.jl wrap_c


const STDERR_BUFFER_LEN = 4096

struct PgQueryInternalParsetreeAndError
    tree::Ptr{Cint}
    stderr_buffer::Cstring
    error::Ptr{Cint}
end

const PG_VERSION = "10.5"
const PG_MAJORVERSION = "10"
const PG_VERSION_NUM = 100005

struct PgQueryError
    message::Cstring
    funcname::Cstring
    filename::Cstring
    lineno::Cint
    cursorpos::Cint
    context::Cstring
end

struct PgQueryParseResult
    parse_tree::Cstring
    stderr_buffer::Cstring
    error::Ptr{PgQueryError}
end

struct PgQueryPlpgsqlParseResult
    plpgsql_funcs::Cstring
    error::Ptr{PgQueryError}
end

struct PgQueryFingerprintResult
    hexdigest::Cstring
    stderr_buffer::Cstring
    error::Ptr{PgQueryError}
end

struct PgQueryNormalizeResult
    normalized_query::Cstring
    error::Ptr{PgQueryError}
end
