clear;clc;
%题目要求y=x^4-3*x^3+20*x^2+44*x+54=0

HasRoot = 0;
k = 0;
err=0.0001;

%求导数df
syms x;
f=@(x) x^4-3*x^3+20*x^2+44*x+54;
df = diff(f,x);
% df = str2num(['@(x)',vectorize(df)]);
df = matlabFunction(df);

x0=2.5+4.5i;
while k<10000
    x = x0 - f(x0)/df(x0);
    if abs(x-x0)<err
        HasRoot = 1;
        break;
    end
    k = k+1;
    x0 = x;
end

fprintf("附近的根为%f\n\n",x0); %附近的根为2.470614