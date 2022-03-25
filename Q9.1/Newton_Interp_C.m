%已知n+1组数据<Xi,Y>,i=1...(n+1)，求 xx 对应的 yy 插值
function yy = Newton_Interp_C(Xi,Y,xx)
yy = zeros(1,length(xx));
    for i = 1:length(xx)
        x = xx(i);
        dx = x - Xi; %(x-x1),(x-x2)
        n = length(Xi);
        yi = zeros(1,n);
        yi(1) = Y(1);
        D(:,1) = Y(:);
        for g = 2:n
            for h = g:n
                D(h,g) = (D(h,g-1)-D(h-1,g-1))/(Xi(h)-Xi(h-g+1));
            end
            yi(g) = D(g,g)*prod(dx(1: g-1)); %f(x1 x2...xn)%(x-x1)(x-x2)...(x-xn)
        end
        Pn = sum(yi);
        yy(i) = Pn;
    end
end