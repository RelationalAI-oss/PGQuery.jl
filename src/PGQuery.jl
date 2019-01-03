module PGQuery

import Libdl

# Load in `deps.jl`, complaining if it does not exist
const depsjl_path = joinpath(@__DIR__, "..", "deps", "deps.jl")
if !isfile(depsjl_path)
    error("PGQuery was not build properly. Please run Pkg.build(\"PGQuery\").")
end

# Module initialization function
function __init__()
    include(depsjl_path)
end

include(joinpath(@__DIR__, "gen", "CEnum.jl"))
using .CEnum

include(joinpath(@__DIR__, "gen", "ctypes.jl"))
export Ctm, Ctime_t, Cclock_t

include(joinpath(@__DIR__, "gen", "libpg_common.jl"))
include(joinpath(@__DIR__, "gen", "libpg_api.jl"))

# export everything with "pg_query_" prefix
foreach(names(@__MODULE__, all=true)) do s
   if startswith(string(s), "pg_query_")
       @eval export $s
   end
end

end # module
