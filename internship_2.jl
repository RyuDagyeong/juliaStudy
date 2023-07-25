# 두 개 종이 번식

using Plots

vonNeumann = [[0,-1],[0,1],[-1,0],[1,0]] #상하좌우
L = 30

σ1 = 5 #생식성
μ1 = 3 #공격성
σ2 = 3
μ2 = 5


function simulation2(σ1, μ1, σ2, μ2)
    G = zeros(Int64, L, L)
    G[rand(1:L),rand(1:L)] = 1 #시작좌표 랜덤으로 주어짐
    G[rand(1:L),rand(1:L)] = 2
    pop_ = []
    anim = @animate for t in 1:100
        alive_ = findall(.!iszero.(G)) #0이 아닌 좌표
        push!(pop_, length(alive_))
        for alive in alive_
            if G[alive]==1
                idx_to = alive + CartesianIndex(rand(vonNeumann)...)
                if !all(0 .< Tuple(idx_to) .≤ L) continue end

                if iszero(G[idx_to]) && (rand() < (σ1 / (σ1 + μ1)))
                    G[idx_to] = 1
                elseif (G[idx_to]==2) && (rand() ≥ (σ1 / (σ1 + μ1)))
                    G[idx_to] = 0
                end
        
            else #G[alive]==2
                idx_to = alive + CartesianIndex(rand(vonNeumann)...)
                if !all(0 .< Tuple(idx_to) .≤ L) continue end

                if iszero(G[idx_to]) && (rand() < (σ2 / (σ2 + μ2)))
                    G[idx_to] = 2
                elseif (G[idx_to]==1) && (rand() ≥ (σ2 / (σ2 + μ2)))
                    G[idx_to] = 0
                end
            end
        end
        heatmap(G,clim=(0,2))
    end
    #return pop_
    gif(anim)
end
#simulation2(σ1, μ1, σ2, μ2)



