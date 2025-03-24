function _isproductok(arg1::VecOrMat{T}, arg2::VecOrMat{T})::Bool where T <: Real
    return (isa(arg1, Vector{T}) && isa(arg2, Vector{T}) && length(arg1) == length(arg2)) ||
           (isa(arg1, Vector{T}) && isa(arg2, Matrix{T}) && length(arg1) == size(arg2,1)) ||
           (isa(arg1, Matrix{T}) && isa(arg2, Vector{T}) && length(arg2) == size(arg1,1)) ||
            (isa(arg1, Matrix{T}) && isa(arg2, Matrix{T}) && size(arg1,1) == size(arg2,2))
end

function _istriangular(A::Matrix{T}; kind::Symbol = :uptri)::Bool where  T <: Real
    if kind != :uptri && kind != :lowtri
        throw(ArgumentError("Input error: kind must be :uptri or :lowtri"))
    end

    m, n = size(A)
    if m != n 
       throw(DimensionMismatch("Matrix is not squared"))
    end

    for i in 1:m-1
        for j in i+1:n
            if kind == :uptri && !iszero(A[j, i]) #checks if the transpose is lowtri 
               return false
            elseif kind == :lowtri && !iszero(A[i, j])
                return false
            end
        end
    end

    return true
end