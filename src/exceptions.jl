struct SQLParserNoParseTreeException <: Exception end

function Base.showerror(io::IO, ::SQLParserNoParseTreeException)
    print(io, "SQLParserNoParseTreeException")
end

struct SQLParserException <: Exception
    inner::Ptr{PgQueryError}
end

function convert_cstring_to_str(c_str)
    c_str == C_NULL ? "" : unsafe_string(c_str)
end

function Base.showerror(io::IO, pe::SQLParserException)
    err = unsafe_load(pe.inner)
    print(io, "SQLParserException: " * convert_cstring_to_str(err.message) *
        " at location " * string(err.cursorpos) * " (" * convert_cstring_to_str(err.funcname) *
        " in " * convert_cstring_to_str(err.filename) * ":" * string(err.lineno) * ")\n")
end
