clear;clc;
%对式子预处理为v=a*u+b, v=1/y, u=1/t
t = 1:1:8; %测量点横坐标
y = [4.00, 6.00, 8.00, 8.80, 9.22, 9.50, 9.70, 9.86]; %测量点纵坐标
t_hat = [0.3, 2.5, 4.1, 5.3, 7.6, 8.2]; %预测点横坐标
fx = @(x,a,b) x.*(a.*x + b).^(-1); %匿名函数
[m, n]=size(t);
u = t(:).^(-1);
v = y(:).^(-1);
A = ones(n,2);
A(:,1) = u;
a = (A'* A) \ (A'* v);
b = a(1); %指数a
a = a(2); %系数c
y_hat = fx(t_hat,a,b);
disp('对应的y值为');
disp(y_hat);

tt = 0:.25:10;
yy = fx(tt,a,b);
plot(t,y,'o',tt,yy);
legend('测量点','最小二乘法曲线');
xlabel('t / tt');
ylabel('y');
title('最小二乘法曲线');
grid on
