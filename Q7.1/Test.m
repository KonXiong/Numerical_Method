function [t1,t2,t3,t4,t5] = Test(H)
t1 = zeros(1,10);
t2 = zeros(1,10);
t3 = zeros(1,10);
t4 = zeros(1,10);
t5 = zeros(1,10);
% H = 10;  %多次测试次数
for p = 2:10
% A = pascal(p); 
A = magic(p);
b = -[1:p]';

disp('**** 线性方程组迭代法测试，线性方程组为:'); disp([A,b]);

for q=1:H
    tic; x1 = Jacobi_Iteration1(A,b); t1(p) = t1(p) + toc;
end
t1(p) = t1(p)/q;
disp('雅可比迭代法一的解为：'); disp(x1);
fprintf('耗费的平均时间为T1=%8.6f(s)\n\n',t1(p));

for q=1:H
    tic; x2 = Jacobi_Iteration2(A,b); t2(p) = t2(p) + toc;
end
t2(p) = t2(p)/q;
disp('雅可比迭代法二的解为：'); disp(x2);
fprintf('耗费的平均时间为T2=%8.6f(s)\n\n',t2(p));

for q=1:H
    tic; x3 = Gauss_Seidel_Iteration1(A,b); t3(p) = t3(p) + toc;
end
t3(p) = t3(p)/q;
disp('高斯赛代尔迭代法一的解为：'); disp(x3);
fprintf('耗费的平均时间为T3=%8.6f(s)\n\n',t3(p));

for q=1:H
    tic; x4 = Gauss_Seidel_Iteration2(A,b); t4(p) = t4(p) + toc;
end
t4(p) = t4(p)/q;
disp('高斯赛代尔迭代法二的解为：'); disp(x4);
fprintf('耗费的平均时间为T4=%8.6f(s)\n\n',t4(p));

for q=1:H
    tic; x5 = Gauss_Elimination_Test(A,b); t5(p) = t5(p) + toc;
end
t5(p) = t5(p)/q;
disp('高斯消元法的解为：'); disp(x5);
fprintf('耗费的平均时间为T5=%8.6f(s)\n\n',t5(p));


end
end


% 求矩阵的谱半径（特征值的绝对值的最大值）
% function p = Spectral_Radius(A)
% d = eig(A);  %求A的所有特征值
% p = max(abs(d));

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
end


%高斯消元法
function x = Gauss_Elimination_Test(A,b)
% disp('消元前的增广矩阵');disp([A,b]);
[U,bb] = Gauss_Elimination(A,b);
% disp('消元后的增广矩阵');disp([U,bb]);
x = Back_Substitution(U,bb);
% disp('方程组的解'); disp(x);
end

function [U,bb] = Gauss_Elimination(A,b)
C = [A,b];
n = length(b);
    for k = 1:(n-1)
        L = eye(n);
        for i = (k+1):n
            mik = C(i,k)/C(k,k);
            L(i,k) = -1 * mik;
        end
        C = L * C;
    end
U = C(:,1:n);
bb = C(:,n+1);
end

% 回代法，x为求解出来的未知数列向量
function x = Back_Substitution(U,bb)
n = length(bb);
x = zeros(n,1);
x(n) = bb(n) / U(n,n);
    for i = (n-1):-1:1
        x(i) = (bb(i) - U(i,(i+1):n) * x((i+1):n)) / U(i,i);
    end
end
% 
% %雅可比迭代过程解的额2-范数曲线显示，揭示收敛性
% function Jacobi_Show_Convergence(A,b)
% n = size(A,1);   %取未知数个数
% L = tril(A,-1);   U = triu(A,1);  D = A - L - U;   %DLU分解
% M = 10;        %最大迭代次数
% x0 = ones(n,1);      %初始 x0,可以随机指定
% xx = zeros(1,M);     %存放每次迭代的解的2-范数
% xx(1) = norm(x0);    %求x0的2-范数
% figure(1024)
% for k=2:M
%     x1 = D \ (-(L+U)*x0 + b);
%     xx(k) = norm(x1);
%     x0 = x1;
%     plot(1:k,xx(1:k),'o-r');
%     grid on;
%     drawnow;
% end
% xlabel('迭代次数');
% ylabel('解的2-范数');
% 
% 
% function Gauss_Seidel_Show_Convergence(A,b)
% n = size(A,1);   %取未知数个数
% L = tril(A,-1);   U = triu(A,1);  D = A - L - U;   %DLU分解
% M = 10;        %最大迭代次数
% x0 = ones(n,1);      %初始 x0,可以随机指定
% xx = zeros(1,M);     %存放每次迭代的解的2-范数
% xx(1) = norm(x0);    %求x0的2-范数
% figure(1024)
% for k=2:M
%     x1 = (D+L) \ (-U*x0 + b);
%     xx(k) = norm(x1);
%     x0 = x1;
%     plot(1:k,xx(1:k),'o-r');
%     grid on;
%     drawnow;
% end
% xlabel('迭代次数');
% ylabel('解的2-范数');