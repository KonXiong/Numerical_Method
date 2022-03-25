function I = Simpson(func,a,b,n)
    x = linspace(a,b,n+1);
    h = (b-a)/n;
    f = func(x);
    I = (f(1) + 4 * sum(f(2:n)) + f(n+1)) * h / 3; %辛普森公式积分
end