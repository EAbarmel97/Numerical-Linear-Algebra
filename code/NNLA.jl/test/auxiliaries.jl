using Test
include("../src/auxiliaries.jl")

@testset "_isproductok tests" begin
    @test_throws MethodError _isproductok()
    @test _isproductok([1.0 2.0], [3.0 4.0; 5.0 6.0]) == false
    @test _isproductok([1.0 2.0], [0.0]) == true
    @test _isproductok([1.0, 2.0], [3.0 4.0; 5.0 6.0]) == true
    @test _isproductok([1.0 2.0 3.0], [4.0, 5.0]) == false
end

@testset "_istriangular tests" begin
    @test_throws MethodError _istriangular()

    M = Matrix{Float64}([[1.0 2.0 ]; [1.0 0.9]])
    I = Matrix{Float64}([[1.0 0.0 0.0 ]; [0.0 1.0 0.0]; [0.0 0.0 1.0]])
    @test _istriangular(M) == false
    @test _istriangular(I, kind=:uptri) == true
    @test _istriangular(I, kind=:lowtri) == true
end