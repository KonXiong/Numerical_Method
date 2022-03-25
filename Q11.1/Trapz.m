function I=Trapz(func,a,b,n)
    x = linspace(a,b,n+1);
    h = (b-a)/n;
    f = func(x);
    I = (0.5 * f(1) + sum(f(2 : n)) + 0.5 * f(n+1)) * h; %梯形公式积分
end