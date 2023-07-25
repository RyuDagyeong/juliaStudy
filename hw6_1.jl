struct Klein
    explicit::Char
end

e = Klein('e'); 가 = Klein('e')
a = Klein('a'); 나 = Klein('a')
b = Klein('b'); 다 = Klein('b')
c = Klein('c'); 라 = Klein('c')

#V={e,a,b,c}:클라인 사원군
 
#가.explicit -> 'e'
#islegal(b)->true  :islegal은 Klein을 받아 e,a,b,c 중 하나인지 아닌지를 체크해주는 함수


#function isidentity(a)
#    return a.explicit=='e'
#end

#모범답안
isidentity(x::Klein) = x.explicit == 'e'
