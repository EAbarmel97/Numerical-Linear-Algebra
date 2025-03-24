using Documenter

# PART 1 

"""
   dot(v1::Vector{T},v2::Vector{T})::T where {T <: Real}

Returns the interior product of two vectors of the same dimension.
"""
function dot(v1::Vector{T}, v2::Vector{T})::T where T <: Real
    if !_isproductok(v1, v2)
        throw(DimensionMismatch("v1 and v2 must have the same dimension"))
    end
    
    c = zero(T)
    
    @inbounds for i in eachindex(v1)
        c += v1[i]v2[i]
    end  
    
    return c 
end

# PART 2 

@doc raw"""
    backsubstitution(A::Matrix{T}, b::Vector{T})::Vector{T} where T <: Real

Returns a vector corresponding to the solution of the system ``Ax = b`` by 
computing:

$x_i = \frac{b_i - \sum_{j=i+1}^{n} A_{ij} x_j}{A_{ii}} \quad \forall i \in [1, n]$
"""
function backsubstitution(A::Matrix{T}, b::Vector{T})::Vector{T} where T <: Real
    if !_istriangular(A; kind = :uptri)
        throw(ArgumentError("input error. Matrix is not triangular"))
    end
    
    if !_isproductok(A, b)
        throw(DimensionMismatch("v1 and v2 must have the same dimension"))
    end

    n = length(b)
    x = zeros(T, n)

    #backsubstition step
    x[end] = b[end]/A[n,n]
    for i in n-1:1
        x[i] = b[i]
        for j in i+1:n
          x[i] -= A[i,j]*x[i] 
        end
        x[i] = x[i]/A[i,i]
    end

    return x
end

function gaussian_elimination!(A::Matrix{T})::Matrix{T} where T <: Real
    m,n = size(A)
    for k in 1:n
      for i in k+1:n
        for j in k+1:n

        end 
      end
    end
   
   return A
end