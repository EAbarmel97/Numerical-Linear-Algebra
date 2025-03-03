# NNLA.jl: Naive Numerical Liner Algebra

A pure Julia implementation of the following routines:  
 1. PART 1: 
    1. dot product
    2. back substitution, gaussian elimination, LU decomposition

# [!Warning]

Because this is not in the public Julia module, but a local one, you'll have to import it as such. i.e making use of the syntax:

```julia
include("path_to_MyLocalModule_jl_file")
using .MyLocalModule: func1, func2, ...
```