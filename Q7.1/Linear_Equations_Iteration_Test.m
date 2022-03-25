function  Linear_Equations_Iteration_Test
clear;clc;
%单次测试方程组的迭代法求解（雅可比、高斯赛戴尔）
A = [ 5.0, 0.2, 2;    %样例线性方程组的系数矩阵
     -0.2,-1.0,-0.1;
      1,  -1,   2.0];
b = [3;-3;-1];
disp('**** 线性方程组迭代法测试，线性方程组为:'); disp([A,b]);
L = tril(A,-1); U = triu(A,1); D = A - L - U;   %DLU分解；
B1 = -D\(L+U);   B2 = -(L+D)\U;  %雅可比、高斯赛戴尔迭代法的B矩阵
p1 = Spectral_Radius(B1);   p2 = Spectral_Radius(B2);  %求谱半径，判断收敛性
fprintf('雅可比迭代矩阵B谱半径=%8.6f,高斯赛戴尔迭代矩阵B谱半径=%8.6f\n\n',p1,p2);
tic; x1 = Jacobi_Iteration1(A,b); t1 = toc;
disp('雅可比迭代法一的解为：'); disp(x1);
fprintf('耗费的时间为T1=%8.6f(s)\n\n',t1);

tic; x2 = Jacobi_Iteration2(A,b); t2 = toc;
disp('雅可比迭代法二的解为：'); disp(x2);
fprintf('耗费的时间为T2=%8.6f(s)\n\n',t2);

tic; x3 = Gauss_Seidel_Iteration1(A,b); t3 = toc;
disp('高斯赛代尔迭代法一的解为：'); disp(x3);
fprintf('耗费的时间为T3=%8.6f(s)\n\n',t3);

tic; x4 = Gauss_Seidel_Iteration2(A,b); t4 = toc;
disp('高斯赛代尔迭代法二的解为：'); disp(x4);
fprintf('耗费的时间为T4=%8.6f(s)\n\n',t4);

% 雅可比迭代过程解的2-范数曲线显示，揭示收敛性
% Jacobi_Show_Convergence(A,b);
Gauss_Seidel_Show_Convergence(A,b);

% 求矩阵的谱半径（特征值的绝对值的最大值）
function p = Spectral_Radius(A)
d = eig(A);  %求A的所有特征值
p = max(abs(d));

%雅可比迭代1：采用C语言思路
function x1 = Jacobi_Iteration1(A,b)
n = size(A,1);   %取未知数个数
x0 = zeros(n,1);  x1 = zeros(n,1); %初始化 x0、x1 数组
M = 10;     %最大迭代次数
for k=1:M
    for j=1:n
        x1(j) = 0;
        for s=1:n
            if(s~=j)
                x1(j) = x1(j) - A(j,s)*x0(s);
            end
        end
        x1(j) = (x1(j) + b(j)) / A(j,j);
    end
    for j=1:n
        x0(j) = x1(j);
    end
end


%雅可比迭代2：采用矩阵的迭代表达式
function x1 = Jacobi_Iteration2(A,b)
n = size(A,1);   %取未知数个数
L = tril(A,-1);  U = triu(A,1);   D = A - L - U;  %DLU分解
M = 10;         %最大迭代次数
x0 = ones(n,1);    %初始 x0，可以随机指定
for k=1:M
    x1 = D \ (-(L+U)*x0 + b);
    x0 = x1;
end

%高斯赛代尔迭代1：采用C语言思路
function x1 = Gauss_Seidel_Iteration1(A,b)
n = size(A,1);   %取未知数个数
x1 = zeros(n,1); %初始化 x 数组
M = 10;
for k=1:M
    for j=1:n
        x1(j) = 0;
        for s=1:n
            if (s~=j)
                x1(j) = x1(j) - A(j,s)*x1(s);
            end
        end
        x1(j) = (x1(j) + b(j))/A(j,j);
    end
end


%高斯赛代尔迭代2：采用矩阵的迭代表达式
function x1 = Gauss_Seidel_Iteration2(A,b)
n = size(A,1);   %取未知数个数
L = tril(A,-1);  U = triu(A,1);   D = A - L - U;  %DLU分解
M = 10;         %最大迭代次数
x0 = ones(n,1);    %初始 x0，可以随机指定
for k=1:M
    x1 = (D+L) \ (-U*x0 + b);
    x0 = x1;
end



%雅可比迭代过程解的2-范数曲线显示，揭示收敛性
function Jacobi_Show_Convergence(A,b)
n = size(A,1);   %取未知数个数
L = tril(A,-1);   U = triu(A,1);  D = A - L - U;   %DLU分解
M = 10;        %最大迭代次数
x0 = ones(n,1);      %初始 x0,可以随机指定
xx = zeros(1,M);     %存放每次迭代的解的2-范数
xx(1) = norm(x0);    %求x0的2-范数
figure(1024)
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

%高斯赛代尔迭代过程解的2-范数曲线显示，揭示收敛性
function Gauss_Seidel_Show_Convergence(A,b)
n = size(A,1);   %取未知数个数
L = tril(A,-1);   U = triu(A,1);  D = A - L - U;   %DLU分解
M = 10;        %最大迭代次数
x0 = ones(n,1);      %初始 x0,可以随机指定
xx = zeros(1,M);     %存放每次迭代的解的2-范数
xx(1) = norm(x0);    %求x0的2-范数
figure(1024)
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
