clear;clc;
t = 1:1:8; %测量点横坐标
y = [4.00, 6.00, 8.00, 8.80, 9.22, 9.50, 9.70, 9.86]; %测量点纵坐标
t_hat = [0.3, 2.5, 4.1, 5.3, 7.6, 8.2]; %预测点横坐标
y_hat = spline(t,y,t_hat); %预测点纵坐标
disp('对应的y值为');
disp(y_hat)

tt = 0:.25:10;
yy = spline(t,y,tt);
plot(t,y,'o',tt,yy);
legend('测量点','样条插值曲线');
xlabel('t / tt');
ylabel('y');
title('样条插值曲线');
grid on

