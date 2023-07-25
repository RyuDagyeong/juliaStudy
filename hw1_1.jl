#https://hackmd.io/x1zXs1R0QaCf_lqf00lydQ#3-2

function F(n)
    #문제에서 n은 자연수라 가정-> n<=0인 경우는 고려하지 않음
    if n==1||n==2
        return 1
    else
        return F(n-1)+F(n-2)
    end
end