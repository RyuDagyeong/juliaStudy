# function I(f,a,b)
#     n=1
#     dx = (b-a)/n
#     F = Inf
#     S=0
#     while abs(F - S) > 10^(-3)
#         F=0
#         for k in 0:n-1
#             F+=f(a+k*dx)*dx
#         end
#         n *= 2
#         dx = (b-a)/n
#         S=0
#         for k in 0:n-1
#             S+=f(a+k*dx)*dx
#         end
#     end
#     return S
# end
# f(x)=x^2
# I(f,2,5)


#모범답안
f(x) = x^2 + 4x + 4
function I(f,a,b)
    h = b-a
    ∫fdx = Inf
    while abs(∫fdx - sum(f.(a:h:b) .* h)) > 1e-3
        ∫fdx = sum(f.(a:h:b) .* h)
        h /= 2
    end
    return sum(f.(a:h:b) .* h)
end
I(f,0,3)
