#using Calculus#꼭 적어주기

#function D(f,x)
#    return derivative(f,x)
#end
#f(x)=x^2+x+1
#D(f,1)

function D(f,x)
    h=1
    df = Inf
    S=0
    while abs(df - S) > 10^(-3) #1e-3으로 적어도 됨
        df=(f(x+h)-f(x))/h
        h/=2
        S=(f(x+h)-f(x))/h
    end
    return S
end
f(x)=x^3+x+1
D(f,2)

