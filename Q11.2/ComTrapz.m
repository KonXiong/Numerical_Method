function I = ComTrapz(func,a,b,n)
    x = linspace(a,b,n+1);
    h = (b-a)/n;
    f(1:n+1) = func(x);
    I = (f(1) + 2 * sum(f(2:n))+f(n+1)) * h / 2;   %复合梯形公式积分
end