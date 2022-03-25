%已知n+1组数据<Xi,Y>,i=1...(n+1)，求 xx 对应的 yy 插值
function yy = Newton_Interp_M(Xi,Y,xx)
% clear;clc;
% xi = 0:0.1:pi;      yi = sin(xi);   %生成插值节点
% xx = 0.15:0.2:pi;   %另一组待插值点
% 
% Xi = xi;
% Y = yi;
    m = length(xx);
    n = length(Xi);
    dx = zeros(m,n);
    for i=1:m
        dx(i,:) = xx(i) - Xi;
    end
    %
    yi = zeros(m,n);
    yi(:,1) = Y(1);
    D(:,1) = Y(:);
    for g = 2:n
        for h = g:n
            D(h,g) = (D(h,g-1)-D(h-1,g-1))/(Xi(h)-Xi(h-g+1));
        end
        for i=1:m
            yi(i,g) = D(g,g)*prod(dx(i,1:g-1));
        end
    end
    yy = sum(yi,2);
end