clear; clc;
x = -2:0.2:2;
y = -2:0.2:3;
[X,Y] = meshgrid(x,y);
Z = X.*exp(-X.^2-Y.^2);
X(:,5) = NaN; %X第5列数据遗失
Y(8,:) = NaN; %Y第8行数据遗失
figure;
[M,c] = contour(X,Y,Z,'--','ShowText','on'); %M为等高线矩阵，c为图层属性
c.LineWidth = 3;
disp(M);