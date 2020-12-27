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

AbstractTrees.printnode(io::IO, x::PGQuery.List) = Base.print(io, string("List(",x.type,") with length=",x.length))

function AbstractTrees.children(x::PGQuery.List)
    @assert x.type == PGQuery.T_List
    children = []
    for i in 1:x.length
        listCell = unsafe_load(x.head, 1)
        push!(children, convert_to_proper_node_type(listCell.data))
    end
    return children
end
