%已知n+1组数据<xi,yi>,i=1...(n+1)，求 xx 对应的 yy 插值
function yy = Lagrange_Interp_M(xi,yi,xx)
n = length(xi)-1;
m = length(xx);     %待插值的数据个数
L = ones(m,n+1);    %基函数矩阵
for j=1:m
    for k=0:n
        for s=0:n
            if (k~=s)
                L(j,k+1) = L(j,k+1)*(xx(j)-xi(s+1))/(xi(k+1)-xi(s+1));
            end
        end
    end
end
yy = L*yi(:);