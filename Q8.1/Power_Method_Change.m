%幂法测试
function Power_Method_Change
clear; clc;
A = [ 2 1 3;
      2 5 1;
      1 2 1];  %测试矩阵
err1 = 0.01; %最大允许误差
[Lamdas, Vectors] = Power(A,err1);
disp('矩阵'); disp(A);
disp('A矩阵精确的特征值、特征向量');
[Vector_real,Lamda_real] = eig(A);
disp([Lamda_real,Vector_real]);
disp('*********幂法求解结果***********');
fprintf('绝对值最大的特征值为:%8.6f\n\n',Lamdas(:,1));
disp('特征向量');  disp(Vectors(:,1));
fprintf('绝对值最小的特征值为: %8.6f\n\n', Lamdas(:,2));
disp('特征向量'); disp(Vectors(:,2));
end

function [Lamda, Vector] = Power(A,err1)
% v0 = ones(size(A,1),1);  %假定v0是元素值均为1的列向量
v0 = rand(size(A,1),2);
B = pinv(A);   %求广义逆矩阵
maxD = 1000;  %最大迭代次数
K = 0;
while (1)
    v1(:,1) = A*v0(:,1);
    v1(:,2) = B*v0(:,2);
    Lamda = mean(v1./v0);
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
Vector = v1./sqrt(sum(v1.^2));
Lamda(:,2) = 1/Lamda(:,2);
end


  