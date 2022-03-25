clear;clc;
X = [0.36 0.001 2; 0.2 0.002 1; 0.15 0.12 1.5; 0.3 0.21 2.6];
[x y]=size(X);
for g=1:x
    %格式输出类似C语言
    disp(sprintf('%-8.2f%-9.3f%.1f\n',X(g,1),X(g,2),X(g,3)));
    %fprintf也能实现输出
%     fprintf('%-8.2f%-9.3f%.1f\n\n',X(g,1),X(g,2),X(g,3));
end
    