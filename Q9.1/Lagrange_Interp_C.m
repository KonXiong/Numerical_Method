%已知n+1组数据<xi,yi>,i=1...(n+1)，求 xx 对应的 yy 插值
function yy = Lagrange_Interp_C(xi,yi,xx)
n = length(xi)-1;
m = length(xx);     %待插值的数据个数
yy = zeros(m,1);
for j=1:m
    L = zeros(n+1,1);   %存放基函数值，初始化
    for k=0:n
        L(k+1) = 1;
        for s=0:n
            if (k~=s)
                L(k+1) = L(k+1)*(xx(j)-xi(s+1))/(xi(k+1)-xi(s+1));
            end
        end
    end
    for k=0:n
        yy(j) = yy(j) + L(k+1)*yi(k+1);
    end
end