clear;clc;
fx = @(x) sin(10*pi*x);
x0=linspace(0,1);
x2=linspace(0,1,1000);
y0=fx(x0);
y2=fx(x2);

%加入噪声
y10=awgn(y0,10);
y20=awgn(y0,20);
figure('Name','加入噪声','NumberTitle','off');
plot(x0,y0,x0,y10,x0,y20);
title('加入噪声');
legend('y0','y10','y20');
grid on;

%对(x0,y10)和(x0,y20)进行样条插值处理
s10=spline(x0,y10,x2);
s20=spline(x0,y20,x2);
figure('Name','样条插值处理','NumberTitle','off');
plot(x2,y2,x2,s10,x2,s20);
title('样条插值处理');
legend('y2','s10','s20');
grid on;

%对(x0,y10)和(x0,y20)进行最小二乘法处理
n=25; %拟合次数
p1 = polyfit(x0, y10, n); %最小二乘法拟合n次多项式
p2 = polyfit(x0, y20, n);
p10 = polyval(p1,x2);
p20 = polyval(p2,x2);
figure('Name','最小二乘法处理','NumberTitle','off');
plot(x2,y2,x2,p10,x2,p20);
title('最小二乘法处理');
legend('y2','p10','p20');
grid on;