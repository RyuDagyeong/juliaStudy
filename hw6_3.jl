include("hw6_1.jl")
import Base.*

function *(x::Klein, y::Klein)
    al=[e a b c]
    K=[e a b c;a e c b;b c e a;c b a e]
    
    j=0
    w=0
    for i in 1:4
        if al[i]==x
            j=i
        end#여기도 end 써야함
        if al[i]==y
            w=i
        end
    end #x,y의 인덱스를 찾음

    return K[j,w]
end


#모범답안
#hardtable = 
#[e a b c
# a e c b
# b c e a
# c b a e]

#import Base.*
#function *(x::Klein, y::Klein)
#    i = (1:4)[x.explicit .== ['e','a','b','c']]
#    j = (1:4)[y.explicit .== ['e','a','b','c']]
#    return first(hardtable[i,j])
#end