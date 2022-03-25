clear;clc;
%将题目化成求y=x^2-3方程的根

HasRoot = 0;
k = 0;
err=0.0001;

%求导数df
syms x;
f=@(x) x^2-3;
df = diff(f,x);
% df = str2num(['@(x)',vectorize(df)]);
df = matlabFunction(df);

x0=1.7;
while k<10000
    x = x0 - f(x0)/df(x0);
    if abs(x-x0)<err
        HasRoot = 1;
        break;
    end
    k = k+1;
    x0 = x;
end

fprintf("根号3的值为%.4f\n\n",x0); %根号3的值为1.7321