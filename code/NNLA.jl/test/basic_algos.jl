include("../src/NNLA.jl")
using .NNLA: dot, backsubstitution

@testset "dot product tests" begin
    @test dot(Float64[1.0,0.0,0.0], Float64[0.0, 1.0,0.0]) == 0.0
    @test isapprox(dot(Float64[1.0,1.0,0.0], Float64[1.0, 1.0,0.0]), 2.0) == true
    @test_throws DimensionMismatch dot(Float64[1.0,0.0,0.0], Float64[0.0, 1.0,0.0, 0.0])
end

@testset "backsubstitution tests" begin
    A = [1.0 2.0 3.0; 0.0 1.0 4.0; 0.0 0.0 1.0]
    b = [1.0, 2.0, 3.0]
    @test backsubstitution(A, b) ≈ [1.0, 0.0, 3.0]
end

# @testset "gaussian_elimination! tests" begin end