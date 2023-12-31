#internship_2 일반화

# 두 개 종이 번식
using Random
using Plots

vonNeumann = [[0,-1],[0,1],[-1,0],[1,0]] #상하좌우
L = 30

σ_ = [5, 5] #생식성 #일반화하기 위해 배열을 사용 <- σ1, σ2는 일반화하기 까다로움 
μ_ = [5, 5] #공격성


function simulation2_2(σ_, μ_) #σ, μ를 배열로 선언함으로써 함수 인자의 수도 줄일 수 있음
    sn = length(σ_) #종 개수
    G = zeros(Int64, L, L)
    for k in 1:sn
        G[rand(1:L),rand(1:L)] = k #시작좌표 랜덤으로 주어짐
    end
    pop_ = []
    anim = @animate for t in 1:100 #반복횟수 더 늘려야겠다
        alive_ = findall(.!iszero.(G)) #0이 아닌 좌표
        push!(pop_, length(alive_))
        for alive in shuffle(alive_) #suffle은 Random에 내장된 것으로, 배열의 원소 순서를 섞어줌
                                      #-> σ, μ에 depend 된 각 종들에게 공평하게 선공할 기회가 가도록 설정한 것
                                      #추가적으로 번식, 공격하는 세부적인 규칙은 필요하다면 추가로 설정해도 됨
            k = G[alive] #2개 종에서 k는 0또는 1또는 2
            if iszero(k) continue end

            idx_to = alive + CartesianIndex(rand(vonNeumann)...)
            if !all(0 .< Tuple(idx_to) .≤ L) continue end

            if iszero(G[idx_to]) && (rand() < (σ_[k] / (σ_[k] + μ_[k])))
                G[idx_to] = k
            elseif (G[idx_to]!=k) && (rand() ≥ (σ_[k] / (σ_[k] + μ_[k])))
                G[idx_to] = 0 #G[idx_to]!=k에서 G[idx_to]가 0인 경우는 어차피 0으로 그대로 바꾸는 것이므로 상관없음
            end
        end
        heatmap(G,clim=(0,sn))
    end
    #return pop_
    gif(anim)
end
#simulation2(σ1, μ_[1], σ2, μ2)

simulation2_2(σ_, μ_)

#시뮬레이션이 1개 종과 빈 셀만 남았을 때는 굳이 더 반복할 필요 없음(어차피 1개 종이 이긴거니까)
 #-> length(unique(G)) < 3 && (0 in unique(G)) 를 시뮬레이션 종료조건으로 사용할 수 있음(1:100대신)
 #이때 unique(G)는 G를 이루고있는 원소를 값 별로 하나씩만 리턴 -> unique(G) == [3,1,0,2]
