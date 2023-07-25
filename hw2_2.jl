# n을 이용해서 @time FA(n), @time FA2(n)을 계산하는 건 잘 안되네 
#julia는 배열의 인덱스가 0이 아닌 1부터 시작함
include("hw2_1.jl")

function FA2(n)
    x=[]
    for i in 1:n
        if i==1||i==2
            push!(x,1)
        else
            push!(x,x[i-1]+x[i-2])
        end
    end
    return x
end
@time FA(40)
@time FA2(40)
