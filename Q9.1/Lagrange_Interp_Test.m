function Lagrange_Interp_Test
clear all; clc;
xi = 0:0.1:pi;      yi = sin(xi);   %生成插值节点
% xx = [pi/2, pi/3, pi/4 ,pi/5, pi/6, pi/7, pi/8];   %待插值点
xx = 0.15:0.2:pi;   %另一组待插值点
yy = Lagrange_Interp_M(xi,yi,xx);
% 显示插值效果
figure(1)
plot(xi,yi,xx,yy,'*r');
grid on;
legend('插值曲线(sin)','插值结果');
xlabel('x');

% 测试两个算法的平均运行时间
D = 1000;   %重复运行次数
[T1,T2] = Time_Test1(xi,yi,xx,D);
title(sprintf('平均时间：C程序=%8.8fs,M程序=%8.8fs\n\n',T1,T2));

% Runge 现象演示（y = 1/1+x^2）
xx = (-10:0.1:10)';         yy0 = 1./(1+xx.^2); % Runge 函数
xi1 = linspace(-10,10,3);   yi1 = 1./(1+xi1.^2);%第1组插值节点，3个插值节点
xi2 = linspace(-10,10,6);   yi2 = 1./(1+xi2.^2);%第2组插值节点，6个插值节点
xi3 = linspace(-10,10,11);  yi3 = 1./(1+xi3.^2);%第3组插值节点，11个插值节点
yy1 = Lagrange_Interp_M(xi1,yi1,xx);    %用第1组插值节点对xx进行插值
yy2 = Lagrange_Interp_M(xi2,yi2,xx);    %用第2组插值节点对xx进行插值
yy3 = Lagrange_Interp_M(xi3,yi3,xx);    %用第3组插值节点对xx进行插值
err(1)=sum((yy1-yy0).^2);  err(2)=sum((yy2-yy0).^2);  err(3)=sum((yy3-yy0).^2);
figure(2)
p1=plot(xx,[yy0,yy1,yy2,yy3]);
set(p1,'LineWidth',2);
legend('Runge曲线','3个节点插值','6个节点插值','11个节点插值');
xlabel('x');
title(sprintf('插值误差=[%4.2f, %4.2f, %4.2f]',err));
grid on

function [T1,T2] = Time_Test1(xi,yi,xx,D)
T1 = 0;     T2 = 0;
for k=1:D
    tic; Lagrange_Interp_C(xi,yi,xx); T1 = T1 + toc;
    tic; Lagrange_Interp_M(xi,yi,xx); T2 = T2 + toc;
end
T1 = T1/D;  T2 = T2/D;

