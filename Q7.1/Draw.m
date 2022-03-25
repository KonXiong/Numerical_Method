clear all;clc;
H = 50;  %多次测试次数
[T1,T2,T3,T4,T5] = Test(H);
x = 2:10;
figure;
plot(x,T1(2:10));
hold on;
plot(x,T2(2:10));
plot(x,T3(2:10));
plot(x,T4(2:10));
plot(x,T5(2:10));
grid on;
title('各方法求线性方程组的解');
legend('雅可比迭代(C语言)','雅可比迭代(矩阵的迭代表达式)','高斯赛代尔迭代(C语言)','高斯赛代尔迭代(矩阵的迭代表达式)','高斯消元法');