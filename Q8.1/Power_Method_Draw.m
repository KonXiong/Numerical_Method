%幂法测试
% function Power_Method
clear; clc;
A = [ 2 1 3;
      2 5 1;
      1 2 1];  %测试矩阵
err1 = 0.01; %最大允许误差
[Lamda1, Vector1] = Power(A,err1);
disp('矩阵'); disp(A);
disp('A矩阵精确的特征值、特征向量');
[Vectors,Lamdas] = eig(A);
disp([Lamdas,Vectors]);
disp('*********幂法求解结果***********');
fprintf('绝对值最大的特征值为:%8.6f\n\n',Lamda1);
disp('特征向量');  disp(Vector1);
[Lamda2, Vector2] = Inverse_Power(A,err1);
fprintf('绝对值最小的特征值为: %8.6f\n\n', Lamda2);
disp('特征向量'); disp(Vector2);

% %原点平移法（调用幂法函数）的测试语句
% disp('*********原点平移法(幂法函数)求解结果***********');
% for p = 0:1:10
%     [Lamda3, Vector3] = Origin_Translation(A,err1,p);
%     fprintf('当p=%d时的绝对值最大的特征值为:%8.6f\n\n',p,Lamda3);
% %     disp('特征向量'); 
%     fprintf('当p=%d时的特征向量\n',p);
%     disp(Vector3);
% end


%原点平移法（调用反幂法函数）的测试语句
disp('*********原点平移法(反幂法函数)求解结果***********');
y = zeros(1,1001);
h=1;
for p = 0:0.1:100
    [Lamda4, Vector4] = Origin_Translation_Inverse(A,err1,p);   
    fprintf('当p=%d时的绝对值最小的特征值为:%8.6f\n\n',p,Lamda4);
%     disp('特征向量');  
    fprintf('当p=%d时的特征向量\n',p);
    disp(Vector4);
    y(h) = Lamda4;
    h=h+1;
end

x=0:0.1:100;
plot(x,y);
grid on;
title('λ随p的变化关系');
% end

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

%原点平移法，调用幂法函数
function [Lamda1, Vector1] = Origin_Translation(A,err1,p)
B = A - p * eye(size(A));
[LamdaB, Vector1] = Power(B, err1);
Lamda1 = LamdaB + p;
end

%原点平移法，调用反幂法函数
function [Lamda1, Vector1] = Origin_Translation_Inverse(A,err1,p)
B = A - p * eye(size(A));
[LamdaB, Vector1] = Inverse_Power(B, err1);
Lamda1 = LamdaB + p;
end
  