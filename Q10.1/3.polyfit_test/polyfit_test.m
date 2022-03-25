clear;clc;
t = 1:1:8; %测量点横坐标
y = [4.00, 6.00, 8.00, 8.80, 9.22, 9.50, 9.70, 9.86]; %测量点纵坐标
t_hat = [0.3, 2.5, 4.1, 5.3, 7.6, 8.2]; %预测点横坐标
n=3; %拟合次数
p = polyfit(t, y, n); %最小二乘法拟合n次多项式
y_hat = polyval(p, t_hat);
disp('对应的y值为');
disp(y_hat);

tt = 0:.25:10;
yy = polyval(p, tt);
plot(t,y,'o',tt,yy);
legend('测量点','最小二乘法（内置）曲线');
xlabel('t / tt');
ylabel('y');
title('最小二乘法（内置）');
grid on