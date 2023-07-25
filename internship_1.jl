# 한 개 종이 번식 = 단일배양

using Plots

vonNeumann = [[0,-1],[0,1],[-1,0],[1,0]] #상하좌우
L = 30

σ = 5 # Reproduction #\sigma
μ = 3 # Predation #\mu #a종이 a종을 공격하는 것과 b종을 공격하는 비율이 다를 수 있음
#ϵ : exchange(migration) ->나중에 고려

#pop_1=simulation(5,3), pop_2=simulation(1,3)으로 두 그래프 plot 비교가능
#plot(pop_1) #plot!(pop_2)

function simulation(σ, μ)
    G = zeros(Int64, L, L)
    G[rand(1:L),rand(1:L)] = 1 #시작좌표 랜덤으로 주어짐
    pop_ = []
    for t in 1:100
        alive_ = findall(.!iszero.(G))#좌표(CartesianIndex)를 반환 #alive_는 벡터
        push!(pop_, length(alive_))
        for alive in alive_
            idx_to = alive + CartesianIndex(rand(vonNeumann)...) #폰노이만 네 가지 방향 중 하나 고름 = selection
            if !all(0 .< Tuple(idx_to) .≤ L) continue end #가장자리가 닫힌 것으로 가정, \le는 이하 \ge는 이상
                #all: 전부 true여야 true 반환
            if iszero(G[idx_to]) && (rand() < (σ / (σ + μ))) #빈 셀이고 확률 만족해야 reproduction가능
                G[idx_to] = 1
            end
        end
    end
    return pop_
end

#plot(1:10, last.(result), xlabel = "σ", ylabel = "population at t = 100")
#result = [last(simulation.(sigma, 3)) for sigma in 1:10]
@time result = [[last(simulation.(sigma, 3)) for seed in 1:50] for sigma in 1:10]
#last 기능:
#result = simulation.(1:10, 3)
#->10-element Vector{Vector{Any}}:
#   [1, 1, 1, 2, 2, 2, 3, 4, 4, 5  …  209, 211, 214, 216, 222, 226, 231, 235, 236, 239]        
#    [1, 1, 1, 2, 2, 2, 2, 3, 3, 3  …  271, 282, 291, 297, 300, 308, 316, 327, 339, 346]        
#    [1, 1, 1, 1, 2, 3, 4, 5, 7, 10  …  799, 807, 816, 822, 829, 836, 836, 841, 846, 851]       
#    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10  …  741, 750, 767, 778, 789, 802, 814, 819, 830, 838]       
#    [1, 2, 3, 3, 5, 6, 8, 10, 13, 18  …  849, 853, 862, 865, 870, 874, 877, 878, 884, 885]     
#    [1, 2, 2, 3, 3, 3, 4, 5, 7, 7  …  900, 900, 900, 900, 900, 900, 900, 900, 900, 900]        
#    [1, 2, 2, 3, 3, 4, 6, 6, 9, 12  …  885, 888, 890, 890, 892, 895, 895, 896, 896, 897]       
#    [1, 2, 3, 4, 5, 6, 8, 10, 13, 17  …  874, 878, 880, 881, 887, 889, 893, 895, 895, 896]     
#    [1, 2, 4, 7, 11, 15, 17, 21, 25, 28  …  891, 895, 897, 899, 900, 900, 900, 900, 900, 900]  
#    [1, 2, 4, 5, 8, 11, 15, 19, 22, 27  …  897, 898, 900, 900, 900, 900, 900, 900, 900, 900]
#last.(result)
#->10-element Vector{Int64}:
   #239
   #346
   #851
   #838
   #885
   #900
   #897
   #896
   #900
   #900
#end기능과 헷갈리면 안됨
#result[end]는 [1, 2, 4, 5, 8, 11, 15, 19, 22, 27  …  897, 898, 900, 900, 900, 900, 900, 900, 900, 900]임


p1 = plot()
for sigma in 1:10
    scatter!(p1, repeat([sigma], 50), result[sigma]) #help?> repeat를 보면 인자의 첫번째엔 벡터가 들어가야함을 알려줌
end
p1 #이를 에러바로 표현 가능
#실행 후 terminal 창에 p1입력해야 그래프 나옴


# 히트맵을 그려 움짤 만들기 가능
# anim = @animate for t in 1:100
#     alive_ = findall(.!iszero.(G))
#     push!(pop_, length(alive_))
#     for alive in alive_
#         idx_to = alive + CartesianIndex(rand(vonNeumann)...)
#         if !all(0 .< Tuple(idx_to) .≤ L) continue end

#         if iszero(G[idx_to]) && (rand() < (σ / (σ + μ)))
#             G[idx_to] = 1
#         end
#     end
#     heatmap(G)
# end
#gif(anim)

#polymorphism: 매개변수의 자료형에 따라 함수가 달라짐 
  #ex) sum(a:{bool})는 count(a)와 같음 -> a가 0또는 1로 이루어진 벡터라면 sum(a), count(a)모두 a에서 1의 갯수를 알려줌

#논문참고: scholar 검색 -> Junpyo Park 검색 -> https://pubs.aip.org/aip/cha/article/23/2/023128/135778/Persistent-coexistence-of-cyclically-competing