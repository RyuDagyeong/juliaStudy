#hw5_3문제는 실패
include("hw5_1.jl")

#n이하의 모든 소수를 리턴(소인수분해 아님)
function factor(n) 
    fac=Int64[]
    for i in 2:n
        if i==2||i==3
            push!(fac,i)
        else
            for j in fac
                if i%j==0
                    break
                elseif j==fac[end]
                    push!(fac,i)
                end
            end
        end
    end
    return fac
end


function eratosthenes(n)
    fac=factor(n)                       #n이하의 소수들로 이루어진 벡터
    a=[[1]]
    t=1
    for i in 2:n                        #i==1인 경우는 a 배열에 넣고 시작
        if t<=length(fac) && i==fac[t]  #i가 소수인 경우
            push!(a,[i])
            t+=1                        #if i in fac를 하면 모든 fac의 원소를 돌아봐야하므로 비효율적
        else
            push!(a,factorize(i))
        end
    end
    return a,fac
end
F, P = eratosthenes(20)