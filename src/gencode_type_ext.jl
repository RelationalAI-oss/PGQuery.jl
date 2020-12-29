const LONG_MAX = Base.typemin(Int32)
const AttrNumber = Int16
const FdwRoutine = Cvoid
const BlockNumber = UInt32
const HTAB = Cvoid
const OffsetNumber = UInt16
const MemoryContext = Ptr{Cvoid} # Ptr{MemoryContextData}
const PLpgSQL_function = Cvoid
const bool = Cuchar
const TupleTableSlot = Cvoid
const dsa_area = Cvoid
const dsa_pointer = Ptr{Cvoid} # UInt64
const ItemPointer = Ptr{Cvoid} # UInt64
const int8 = UInt8
const uint8 = UInt8
const int16 = UInt16
const uint16 = UInt16
const int32 = Int32
const uint32 = UInt32
const bits8 = uint8
const bits16 = uint16
const bits32 = uint32
const Size = UInt64
const Index = uint32
const Offset = int32
const UINT_MAX = Base.typemax(UInt64)
const Datum = UInt64
#=
union ValUnion
{
    long        ival;       /* machine integer */
    char       *str;        /* string */
}           val;
=#
const ValUnion = Ptr{Cvoid}

# struct ANONYMOUS1_data
#     #=
#     union
#     {
#         void       *ptr_value;
#         int         int_value;
#         Oid         oid_value;
#     }           data;
#     =#
#     ptr_value::Ptr{Cvoid} # Union{Ptr{List}, Cint, Oid=Cint}
# end
