@testset "aux funcs part1.jl" begin
    # aux function __isproductok to test internal product correctness
    @test_throws TypeError __isproductok()
    @test __isproductok([1.0 2.0], [3.0 4.0; 5.0 6.0]) == false
    @test __isproductok([1.0 2.0], []) == false
    @test __isproductok([1.0, 2.0], [3.0 4.0; 5.0 6.0]) == true
    @test __isproductok([1.0 2.0 3.0], [4.0, 5.0]) == false

    # aux function __istriangular to test whether a matrix is triangular (upper)
    @test_throws TypeError __istriangular()

    M = Matrix{Float}([[1.0 2.0 ]; [1.0 0.9]])
    I = Matrix{Float}([[1.0 0.0 0.0 ]; [0.0 1.0 0.0]; [0.0 0.0 1.0]])
    @test __istriangular(M) == false
    @test __istriangular(I) == true
end

@testset "dot product" begin
    @test dot(Float64[1.0,0.0,0.0], Float64[0.0, 1.0,0.0]) == 0.0
    @test isapprox(dot(Float64[1.0,1.0,0.0], Float64[0.0, 1.0,0.0]), 2.0) == true
end