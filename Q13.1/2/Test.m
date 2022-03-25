clear;clc;
%x=tan(x)，视为y=tan(x)-x趋向于0
%arctan(x) = x，则可视为y=arctan(x) 和 y=x的交点
%cos(x) = sin(x)，可视为y=cos(x)和sin(x)的交点

%采用的牛顿法
HasRoot = 0;
k = 0;
err=0.0001;

%求导数df
syms x;
f=@(x) tan(x)-x;
df = diff(f,x);
% df = str2num(['@(x)',vectorize(df)]);
df = matlabFunction(df);

x0=4.5;
while k<10000
    x = x0 - f(x0)/df(x0);
    if abs(x-x0)<err
        HasRoot = 1;
        break;
    end
    k = k+1;
    x0 = x;
end

fprintf("附近的根为%f\n\n",x0); %附近的根为4.493410