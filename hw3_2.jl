#scope에 대해 공부하기
#julia sccpe of variable 검색->https://docs.julialang.org/en/v1/manual/variables-and-scoping/
#전체주석처리(vs코드 공통사항): 해당부분 드래그 후 ctrl + /
#julia는 지역변수와 전역변수의 선언이 까다로움->무조건 함수로 코드짜기
include("hw3_1.jl")

#최종 보완 답안
function ff(W,b)
    y = [7; 6; 7]
    X = [6 8 ; 9 4 ; 3 10]
    L_ = [L(W,b)]
    W0 = W #여기에 안적어주면 while문 안의 지역변수가 되므로 return 불가.
    b0 = b #여기에서 선언해줌으로써 이 변수의 오른쪽 안의 모두에 변수범위가 적용됨
    #L의 초기원소값이 1이하인 경우를 고려하여 위와 같이 업데이트
    while L_[end] ≥ 1 #이렇게 할 수 있구나!
        W0 = rand(2)
        b0 = randn(3)
        L0 = L(W0,b0)
        if L0 < L_[end]
            push!(L_, L0)
        end
    end
    return L_, W0, b0, X * W0 .+ b0
end

W = rand(2)
b = rand(3)
a,b,c,d=ff(W,b)
#L_, W0, b0, X * W0 + b0=ff(W,b)로 쓰고싶지만 연산식은 변수명이 될 수 없음





# #방법1-함수로 정의->이게 트렌드!
# function ff() #함수의 input을 비워두는 것보다 변수인 W0,b0 초기값을 넣어주는 게 좋음
#     y = [7; 6; 7]
#     X = [6 8 ; 9 4 ; 3 10]
#     W0=[10; 10]
#     b0=[10; 10; 10]
#     L_=[]
#     while(L(W0,b0)>=1)
#         W=rand(2)
#         b=randn(3)
#         if (L(W0,b0)>L(W,b))
#             W0=W 
#             b0=b
#             push!(L_,L(W0,b0))
#          end
#     end
#     return (L_,W0,b0,X*W0+b0)    
# end
# q,w,e,r = ff()
# #콘솔창에 q,w,e,r 따로 입력하면 결과나옴
# #이렇게 출력해야 업데이트






#선배답안
# y = [7; 6; 7]
# X = [6 8 ; 9 4 ; 3 10]
# W0 = rand(2)
# b0 = rand(3)
# L_ = [Inf]
# while L_[end] ≥ 1
#     W0 = rand(2)
#     b0 = randn(3)
#     L0 = L(W0,b0)
#     if L0 < L_[end]
#         push!(L_, L0)
#     else
#         push!(L_, L_[end])
#     end
# end
# X * W0 + b0

# using Plots
# plot(L_, label = "Loss")






#이 밑으로 안봐도 됨
#scope문제는 나중에 해결됨

#방법2
# y = [7; 6; 7]
# X = [6 8 ; 9 4 ; 3 10]
# begin
#     local W0=[10; 10]
#     local b0=[10; 10; 10]
#     L_=[]
#     while(L(W0,b0)>=1)
#         W=rand(2)
#         b=randn(3)
#         print("$(L([1;1],[1;1;1]))")
#         if (L(W0,b0)>L(W,b))
#             W0=W
#             b0=b
#             push!(L_,L(W0,b0))
#         end
#         print("1")
#     end
# end

# # #방법3
# y = [7; 6; 7]
# X = [6 8 ; 9 4 ; 3 10]
# W0=[10; 10]
# b0=[10; 10; 10]
# L_=[]
# while(L(W0,b0)>=1)
#     W=rand(2)
#     b=randn(3)
#     if (L(W0,b0)>L(W,b))
#         global W0=W
#         global b0=b
#         push!(L_,L(W0,b0))
#     end
#     L_
# end