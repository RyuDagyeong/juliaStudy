#shift+enter로 실행하면 안됨->오른쪽상단 재생버튼
include("hw1_2.jl")#이 파일에서 F1(n) 함수를 정의함

function FA(n)
    x=[]
    for i in 1:n
        push!(x,F1(i))
    end
    return x
end