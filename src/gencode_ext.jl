
function convert_to_proper_node_type(node)
    node_type_enum = unsafe_load(convert(Ptr{Node}, node)).type
    if node_type_enum in [T_Integer, T_Float, T_String, T_BitString, T_Null]
        unsafe_load(convert(Ptr{Value}, node))
    else
        node_type = convert_to_node_type(Val(node_type_enum))
        unsafe_load(convert(Ptr{node_type}, node))
    end
end

const SIMPLE_TYPES = [
    Cint,
    Cstring,
    Cvoid,
    Int8,
    UInt8,
    Int16,
    UInt16,
    Int32,
    UInt32,
    bool,
]

function _is_simple_type(fld_tp)
    return fld_tp in SIMPLE_TYPES
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

function Base.iterate(lst::List, state=(1, C_NULL))
    (state_idx, state_ptr) = state
    state_idx > lst.length && return nothing
    currentNode = state_idx == 1 ? lst.head : state_ptr
    state_idx == lst.length && @assert currentNode == lst.tail "The last item should be equal to tail"
    currentListCell = unsafe_load(currentNode)

    return (convert_to_proper_node_type(currentListCell.data.ptr_value), (state_idx+1, currentListCell.next))
end

Base.IteratorSize(::Type{List}) = Base.HasLength()
Base.IteratorEltype(::Type{List}) = Base.EltypeUnknown()
Base.length(lst::List) = lst.length
Base.size(lst::List) = (Base.length(lst),)

function Base.getindex(lst::List, i::Int)
    1 <= i <= lst.length || throw(BoundsError(lst, i))
    currentNode = lst.head
    for idx in 2:i
        currentListCell = unsafe_load(currentNode)
        currentNode = currentListCell.next
    end
    currentListCell = unsafe_load(currentNode)
    return convert_to_proper_node_type(currentListCell.data.ptr_value)
end
