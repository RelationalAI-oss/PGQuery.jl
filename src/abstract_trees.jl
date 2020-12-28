function convert_to_proper_node_type(node)
    node_type_enum = unsafe_load(convert(Ptr{Node}, node)).type
    if node_type_enum in [T_Integer, T_Float, T_String, T_BitString, T_Null]
        unsafe_load(convert(Ptr{Value}, node))
    else
        node_type = convert_to_node_type(Val(node_type_enum))
        unsafe_load(convert(Ptr{node_type}, node))
    end
end

function _is_simple_type(fld_tp)
    return fld_tp in [Cint, Cstring, Cvoid]
end

function _is_simple_type(fld_tp::Type{Ptr{T}}) where T
    return _is_simple_type(T)
end

function simple_type_value(fld)
    return fld
end

function simple_type_value(fld::Ptr{Cvoid})
    return fld
end

function simple_type_value(fld::Cstring)
    return string("\"", fld == C_NULL ? "" : convert_cstring_to_str(fld), "\"")
end

function simple_type_value(fld::Ptr{Node})
    return fld == C_NULL ? fld : convert_to_proper_node_type(fld)
end

function simple_type_value(fld::Ptr{T}) where T
    return fld == C_NULL ? fld : simple_type_value(unsafe_load(fld))
end

struct FieldNameAndValuePair
    name::String
    value
end

function AbstractTrees.printnode(io::IO, x::FieldNameAndValuePair)
    if x.value isa Ptr && x.value == C_NULL
        Base.print(io, string(x.name, " -> ( 0x0 )"))
    else
        Base.print(io, x.name)
    end
end

function AbstractTrees.children(x::FieldNameAndValuePair)
    x.value isa Ptr && x.value == C_NULL && return ()
    return (simple_type_value(x.value), )
end

node_tag_enum_names = map(x -> x[1], CEnum.name_value_pairs(NodeTag))

const IGNORE_LIST = [
    :T_Invalid,
    :T_TIDBitmap, #Cvoid
    :T_List,
    :T_SeqScan, #duplicate of Scan
    :T_DistinctExpr, #duplicate of OpExpr
    :T_NullIfExpr, #duplicate of OpExpr
    :T_Value, # special union struct
    :T_String,
    :T_Null,
    :T_Integer,
    :T_Float,
]

target_node_tag_enum_names = filter(x -> !(x in IGNORE_LIST), node_tag_enum_names)

for enum_name in target_node_tag_enum_names
    enum_name_str = string(enum_name)
    @assert startswith(enum_name_str, "T_")
    tp_name_str = SubString(enum_name_str, 3)
    tp_name = Symbol(tp_name_str)
    try
        tp = eval(Meta.parse("PGQuery.$tp_name"))
        tp == Nothing && continue
        local printnode_body = quote
            hasfield($tp, :type) && $(enum_name != :T_Expr) && @assert x.type == $enum_name "x.type is $(x.type), but expected to be $($enum_name)"
            Base.print(io, $tp_name_str)
            Base.print(io, "(")
        end
        local children_body = quote
            hasfield($tp, :type) && $(enum_name != :T_Expr) && @assert x.type == $enum_name "x.type is $(x.type), but expected to be $($enum_name)"
            children = []
        end
        for (i, (fld, fld_tp)) in enumerate(zip(fieldnames(tp), tp.types))
            fld == :type && continue
            fld_name = string(fld)
            if _is_simple_type(fld_tp)
                printnode_body = quote
                    $printnode_body
                    Base.print(io, $fld_name)
                    Base.print(io, "=")
                    Base.print(io, simple_type_value(x.$fld))
                    $(i < length(fieldnames(tp))) && Base.print(io, ", ")
                end
            else
                children_body = quote
                    $children_body
                    push!(children, FieldNameAndValuePair($fld_name, x.$fld))
                end
            end
        end

        q = (quote
            function convert_to_node_type(::Val{$enum_name})
                return $tp_name
            end
            function AbstractTrees.printnode(io::IO, x::$tp_name)
                $printnode_body
                Base.print(io, ")")
            end

            function AbstractTrees.children(x::$tp_name)
                $children_body
                return children
            end
        end)
        eval(q)
    catch e
        #swallow the error
    end
end

function convert_to_node_type(::Val{T}) where T
    str_name = string(T)
    @assert startswith(str_name, "T_")
    type_name = SubString(str_name, 3)
    return eval(Meta.parse("PGQuery.$type_name"))
end

function AbstractTrees.printnode(io::IO, x::List)
    @assert x.type == T_List
    Base.print(io, string("List(length=",x.length,")"))
end

function convert_to_node_type(::Val{T_List})
    return List
end

function AbstractTrees.children(x::List)
    @assert x.type == T_List
    children = []
    for i in 1:x.length
        listCell = unsafe_load(x.head, 1)
        push!(children, convert_to_proper_node_type(listCell.data.ptr_value))
    end
    return children
end

function AbstractTrees.children(x::Ptr)
    return ()
end

function AbstractTrees.printnode(io::IO, x::Value)
    if x.type == T_Integer
        Base.print(io, convert(Int64, x.val))
    elseif x.type == T_Float || x.type == T_String || x.type == T_BitString
        val = simple_type_value(convert(Cstring, x.val))
        if x.type == T_Float
            Base.print(io, Base.parse(Float64, val[2:end-1]))
        elseif x.type == T_String
            Base.print(io, val)
        elseif x.type == T_BitString
            Base.print(io, string("bitstring(",val,")"))
        end
    elseif x.type == T_Null
        Base.print(io, "null")
    else
        throw("not implemented")
    end
end
