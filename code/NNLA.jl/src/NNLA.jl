module NNLA
include("types.jl")
include("auxiliaries.jl")
include("basic_algos.jl")

#part1 and part2 exports
export dot, backsubstitution, gaussian_elimination!

end #end of module