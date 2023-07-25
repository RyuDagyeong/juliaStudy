include("hw6_1.jl")

function inv(x)
    al=[e a b c]
    K=[e a b c;a e c b;b c e a;c b a e]
    
    j=0
    for i in 1:4
        if al[i]==x
            j=i
            break
        end
    end #x의 인덱스를 찾음

    v=0
    for t in 1:4
        if K[j,t]==Klein('e')
            v=t
            break
        end
    end
    return al[v]
end


#모범답안
#inv(x::Klein) = x