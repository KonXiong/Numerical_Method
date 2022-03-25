clear;clc;
A = [ 1, 2, 2;    %线性方程的系数矩阵
     -2,-2,-1;
      2,-3,-2];
b = [2;-3;-1];
disp('消元前的增广矩阵');disp([A,b]);
[U,bb] = Gauss_Elimination(A,b);
disp('消元后的增广矩阵');disp([U,bb]);
x = Back_Substitution(U,bb);
disp('方程组的解'); disp(x);


% 高斯消元法子函数
% A为系数矩阵，b为非齐次列向量
% U 为消元后的上三角系数矩阵，bb为消元后的非齐次列向量
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