#모범답안
function eratosthenes(n::Integer)
    if n == 1 return [[1]] end
    if n == 2 return [[1], [2]] end
    primes = [2]
    factorized = [[1], [2]]
    for k ∈ 3:n
        m = k
        for p ∈ primes
            if m % p == 0
                m ÷= p
                temp = [p; factorized[m]]
                push!(factorized, temp)
                break
            end
        end
        if length(factorized) != k
            push!(primes, k)
            push!(factorized, [k])
        end
    end
    return factorized, primes
end
F, P = eratosthenes(20)
F
P

@time F, P = eratosthenes(100000);
F
P