clear;clc;

A=[   1, 0.4, 0.4;
    0.4,   1, 0.8;
    0.4, 0.8,   1];
a=[   1,   2,   3];

B=[ 1, 2,-2;
    1, 1, 1;
    2, 2, 1];
b=[ 1, 1, 1];

Jacobi_Show_Convergence(A,a);
Jacobi_Show_Convergence(B,b);
Gauss_Seidel_Show_Convergence(A,a);
Gauss_Seidel_Show_Convergence(B,b);
%由图可知A矩阵雅可比不收敛，高斯赛代尔收敛；B矩阵雅可比收敛，高斯赛代尔不收敛

%雅可比迭代过程解的2-范数曲线显示，揭示收敛性
function Jacobi_Show_Convergence(A,b)
n = size(A,1);   %取未知数个数
L = tril(A,-1);   U = triu(A,1);  D = A - L - U;   %DLU分解
M = 10;        %最大迭代次数
x0 = ones(n,1);      %初始 x0,可以随机指定
xx = zeros(1,M);     %存放每次迭代的解的2-范数
xx(1) = norm(x0);    %求x0的2-范数
figure()
for k=2:M
    x1 = D \ (-(L+U)*x0 + b);
    xx(k) = norm(x1);
    x0 = x1;
    plot(1:k,xx(1:k),'o-r');
    grid on;
    drawnow;
end
xlabel('迭代次数');
ylabel('解的2-范数');
end

%高斯赛代尔迭代过程解的2-范数曲线显示，揭示收敛性
function Gauss_Seidel_Show_Convergence(A,b)
n = size(A,1);   %取未知数个数
L = tril(A,-1);   U = triu(A,1);  D = A - L - U;   %DLU分解
M = 10;        %最大迭代次数
x0 = ones(n,1);      %初始 x0,可以随机指定
xx = zeros(1,M);     %存放每次迭代的解的2-范数
xx(1) = norm(x0);    %求x0的2-范数
figure()
for k=2:M
    x1 = (D+L) \ (-U*x0 + b);
    xx(k) = norm(x1);
    x0 = x1;
    plot(1:k,xx(1:k),'o-r');
    grid on;
    drawnow;
end
xlabel('迭代次数');
ylabel('解的2-范数');
end
