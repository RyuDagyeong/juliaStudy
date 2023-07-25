#L(W,b) = sum(abs.(y .- ((X * W) .+ b)))

#어차피 이 코드 전체를 실행시키니까 함수 밖에 정의해도 되네
W0=rand(2)#길이가 2인 벡터
b0=randn(3)
function L(W,b)
    y = [7; 6; 7]    
    X = [6 8 ; 9 4 ; 3 10]
    return sum(abs.(y .- ((X * W) .+ b)))
    #각 원소끼리의 연산은 무조건 브로드캐스팅을 이용한다고 생각하자.
end
L(W0,b0)

# function L(W,b)
#     y = [7; 6; 7]
#     X = [6 8 ; 9 4 ; 3 10]
#     return sqrt(sum((y - X*W + b).^2))
    
#     #sum은 함수로 정의돼있으므로 변수로 사용하지 말 것
#     # sum=0
#     # for value in (y-(X*W+b)).^2
#     #     sum+=value
#     # end
#     # return sum^(1/2)
# end