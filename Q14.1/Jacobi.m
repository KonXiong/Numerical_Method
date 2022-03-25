clear;clc;
A=[ 1, 0.4, 0.4;
    0.4, 1, 0.8;
    0.4, 0.8, 1];
b=[1;2;3];
err=0.05;
% [x1,k] = Jacobi(A,b,err)

% function [x1,M] = Jacobi(A,b,err)
n = size(A,1);
L = tril(A,-1); U = triu(A,1); D = A - L - U;
M = 1000;
x0 = ones(n,1);
for k=1:M
    x1 = D \ (-(L+U) * x0 + b);
    if (norm(A*x1-b)<err),break; end
    x0 = x1;
end
disp('根为');disp(x1);

% end

% function x=Jacobi_fun(x0,L,U,D,b)
%     x = -D'*(L+U)*x0 + D'*b;
% end