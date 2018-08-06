@testset "Epochs" begin
    ep = Epoch{TDB}(Int64(100000), 1e-18)
    ep1 = Epoch{TDB}(ep, 100 * 365.25 * 86400)
    @test ep.offset == ep1.offset

    ep1 = Epoch{TDB}(ep, Inf)
    @test ep1.epoch == typemax(Int64)
    @test ep1.offset == Inf
    ep1 = Epoch{TDB}(ep, -Inf)
    @test ep1.epoch == typemin(Int64)
    @test ep1.offset == -Inf

    tai = Epoch{TAI}(Int64(100000), 0.0)
    tt = Epoch{TT}(tai)
    @test tt.epoch == 100032
    @test tt.offset ≈ 0.184
    tai1 = Epoch{TAI}(tt)
    @test tai1.epoch == 100000
    @test tai1.offset ≈ 0.0
end
