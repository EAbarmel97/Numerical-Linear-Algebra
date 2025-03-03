# algorithms presented in PART 1.
function __isproductok(arg1::VecOrMat{T}, arg2::VecOrMat{T})::Bool where T <: Real
    if isa(arg1, Vector{T}) && isa(arg2,Vector{T}) && length(arg1) == length(arg2)
        return true
    end

    if isa(arg1, Vector{T}) && isa(arg2, Matrix{T}) && length(arg1) == size(arg2)[1]
        return true
    end  
    
    if isa(arg1, Matrix{T}) && isa(arg2, Vector{T}) && length(arg2) == size(arg1)[1]
       return true
    end

    return false
end

"""
   dot(v1::Vector{T},v2::Vector{T})::T where {T <: Real}

Returns the interior product of two vectors of the same dimension.
"""
function dot(v1::Vector{T}, v2::Vector{T})::T where T <: Real
    if !__isproductok(v1, v2)
        throw(ErrorException("dimension mismatch"))
    end
    
    c = zero(T)
    
    @inbounds for i in eachindex(v1)
        c += v1[i]v2[i]
    end  
    
    return c 
end

function __istriangular(A::Matrix{T})::Bool where T <: Real
    m, n = size(A)
    for i in 1:m
        for j in i+1:n
            if !iszero(A[i,j])
               return false
            end
        end
    end

    return true
end

"""
   backsubstition(A::Matrix{T}, b::Vector{T})::Vector{T} where T <: Real

Returns a vector corresponding to the solution of the system ``Ax = b`` by 
computing ``x_i = \\sum_{k=1}^{n} ``

i.e returns ``x = A^{-1}b``
"""
function backsubstition(A::Matrix{T}, b::Vector{T})::Vector{T} where T <: Real
    if !__istriangular(A)
        throw(ErrorException("input error. Matrix is not triangular"))
    end
    
    if !__isproductok(A, b)
        throw(ErrorException("dimension mismatch"))
    end
    n = length(b)
    x = zeros(T, n)

    #backsubstition step
    x[end] = b[end]/A[n,n]
    for i in n-1:1
        x[i] = b[i]
        for j in i+1:n
          x[i] += A[i,j]*x[i] 
        end
        x[i] = x[i]/A[i,i]
    end

    return x
end

function gaussian_elimination!(A::Matrix{T})::Matrix{T} where T <: Real
   
   return A
end