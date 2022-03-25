function I = ComSimpson(func,a,b,nn)
    n = 2 * nn;
    x = linspace(0,1,n+1);
    h = (b-a)/n;
    f(1:n+1) = func(x);
    I = (f(1) + 4*sum(f(2:2:n))+ 2*sum(f(3:2:n-2)) + f(n)) * h / 3; %复合辛普森公式积分
end