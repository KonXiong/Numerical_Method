% function Euler_Test
clear;clc;
x0 = 0;
h = 0.1;
y0 = 1;
n = 10;
[~,yy1] = Euler_Diff(x0,y0,h,n,1);
[~,yy2] = Euler_Diff(x0,y0,h,n,2);
[~,yy3] = Euler_Diff(x0,y0,h,n,3);
[xx,yy4] = Euler_Diff(x0,exp(-0.1),h,n,4,y0);
[~,yy5] = Euler_Diff(x0,y0,h,n,5);

yy0 = exp(xx);
figure
plot(xx,[yy0,yy1,yy2,yy3,yy4,yy5])
grid on;
title('欧拉法求解结果');
legend('精确','前向','后向','梯形','中点','改进');


