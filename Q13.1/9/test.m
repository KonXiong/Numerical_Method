clear;clc;
A=[ 2,-1, 1;
   -1,-2, 3;
    1, 3, 1];
B=[ 1, 2, 3;
    2, 1, 4;
    5, 2, 1];
C=[ 5, 1, 2;
    1, 9, 4;
    2, 4, 20];
err1 = 0.01; %最大允许误差

[Lamda1, Vector1] = Power(A,err1);
fprintf('A矩阵绝对值最大的特征值为:%8.6f\n\n',abs(Lamda1));
disp('A矩阵特征向量（幂法）');  disp(Vector1);
[Lamda2, Vector2] = Inverse_Power(A,err1);
fprintf('A矩阵绝对值最小的特征值为: %8.6f\n\n', abs(Lamda2));
disp('A矩阵特征向量（反幂法）'); disp(Vector2);

[Lamda1, Vector1] = Power(B,err1);
fprintf('B矩阵绝对值最大的特征值为:%8.6f\n\n',abs(Lamda1));
disp('B矩阵特征向量（幂法）');  disp(Vector1);
[Lamda2, Vector2] = Inverse_Power(B,err1);
fprintf('B矩阵绝对值最小的特征值为: %8.6f\n\n', abs(Lamda2));
disp('B矩阵特征向量（反幂法）'); disp(Vector2);

[Lamda1, Vector1] = Power(C,err1);
fprintf('C矩阵绝对值最大的特征值为:%8.6f\n\n',abs(Lamda1));
disp('C矩阵特征向量（幂法）');  disp(Vector1);
[Lamda2, Vector2] = Inverse_Power(C,err1);
fprintf('C矩阵绝对值最小的特征值为: %8.6f\n\n', abs(Lamda2));
disp('C矩阵特征向量（反幂法）'); disp(Vector2);




%原始幂法函数， Lamda1 绝对值最大的特征值， Vector1 特征向量
function [Lamda1, Vector1] = Power(A,err1)
v0 = ones(size(A,1),1);  %假定v0是元素值均为1的列向量
%  或者 v0 = rand(size(A,1),1);
maxD = 1000;  %最大迭代次数
K = 0;
while (1)
    v1 = A*v0;
    Lamda1 = mean(v1./v0);
    err0 = std(v1./v0);
    if (err0 <= err1)
        break;
    end
    v0 = v1;
    K = K+1;
    if (K>maxD)
        disp('超出最大迭代次数，幂法失败！');
        break;
    end
end
Vector1 = v1/sqrt(sum(v1.^2));
end

%反幂法函数，Lamda1 绝对值最小的特征值
function [Lamda1, Vector1] = Inverse_Power(A,err1)
B = pinv(A);   %求广义逆矩阵
[Lamda1, Vector1] = Power(B, err1);
Lamda1 = 1/Lamda1;  %特征值 = 1/逆矩阵的特征值
end