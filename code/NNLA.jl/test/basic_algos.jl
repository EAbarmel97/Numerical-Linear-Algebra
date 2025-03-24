include("../src/NNLA.jl")
using .NNLA: dot, backsubstitution
@testset "dot product tests" begin
    @test dot(Float64[1.0,0.0,0.0], Float64[0.0, 1.0,0.0]) == 0.0
    @test isapprox(dot(Float64[1.0,1.0,0.0], Float64[1.0, 1.0,0.0]), 2.0) == true
end