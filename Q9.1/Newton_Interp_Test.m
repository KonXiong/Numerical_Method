clear all;clc;
format long;
% xi = [0.4 0.5 0.6 0.7 0.8 0.9];
% yi = [-0.916291 -0.693147 -0.510826 -0.355765 -0.223144 -0.105361];%Fun = ln(x)
% xx = [0.78,0.64];
xi = 0:0.1:pi;      yi = sin(xi);   %生成插值节点
xx = 0.15:0.2:pi;   %另一组待插值点
yy = Newton_Interp_M(xi,yi,xx);
figure();
plot(xi,yi,xx,yy,'*r');
grid on;
legend('插值曲线(sin)','插值结果');
xlabel('x');

% 测试算法的平均运行时间
D = 1000;   %重复运行次数
[T1,T2] = Time_Test(xi,yi,xx,D);
title(sprintf('平均时间：C程序=%8.8fs,M程序=%8.8fs\n\n',T1,T2));

function [T1,T2] = Time_Test(xi,yi,xx,D)
T1 = 0;     T2 = 0;
for k=1:D
    tic; Newton_Interp_C(xi,yi,xx); T1 = T1 + toc;
    tic; Newton_Interp_M(xi,yi,xx); T2 = T2 + toc;
end
T1 = T1/D;  T2 = T2/D;
end
