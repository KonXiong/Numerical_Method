clear;clc;

%待求方程x^2-x-1=0
f = @(x) x.^2-x-1;

% %预处理
% x=linspace(-5,5);
% plot(x,f(x));
% grid on
% %正根在(1,2)区间

%显而易见根一定在100的左侧
x = roundn(BM_func(f,0,1000,0.001,0.1),-1);
fprintf('正根x=%.1f，误差为%f\n\n',roundn(x,-1),abs(f(x)));

