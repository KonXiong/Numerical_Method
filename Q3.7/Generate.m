function p = Generate(t)
    p = zeros(1,t+1);
    for m=1:t
        x = t-m+1;
        if rem(x,2)==1
            p(m) = 0;
        else
            p(m) = (1/factorial(x))*(-1)^(x/2);  
        end
    end
    p(t+1) = 1;
end