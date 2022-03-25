function [xx,yy] = Euler_Diff(x0,y0,h,n,OP,y1)
if(nargin<5)
    OP=1;
end
xx = x0 + (1:n)'*h;
yy = zeros(n,1);
for k=1:n
    if (k==1)
        xk_1 = x0;
        yk_1 = y0;
    else
        xk_1 = xx(k-1);
        yk_1 = yy(k-1);
    end
    xk = xx(k);
    switch(OP)
        case 1
            yy(k) = do_Forward_Euler(xk_1, yk_1, h);
        case 2
            yy(k) = do_Backward_Euler(xk, yk_1, h);
        case 3
            yy(k) = do_Trapezoid_Euler(xk_1, xk, yk_1, h);
        case 4
            if (k==1)
                yk_1 = y1;
                yk_2 = y0;
            elseif (k==2)
                yk_1 = yy(1);
                yk_2 = y1;
            else 
                yk_1 = yy(k-1);
                yk_2 = yy(k-2);
            end
            yy(k) = do_Midpoing_Euler(xk_1,yk_2,yk_1,h);
        case 5
            yy(k) = do_Modified_Euler(xk_1, xk, yk_1, h);
        otherwise
            disp('非法OP');
            break;
    end
end
end

%% Fxy(x,y)函数（微分方程）
function z = Fxy(x,~)
% z = 2*x + 5*x*y;
z = exp(x);
end

%前向
function yk = do_Forward_Euler(xk_1, yk_1, h)
yk = yk_1 + h*Fxy(xk_1,yk_1);
end

%后向
function yk = do_Backward_Euler(xk, yk_1, h)
yk = yk_1;
for s = 1:100
    yk1 = yk_1 + h*Fxy(xk,yk);
    e1 = abs(yk1-yk);
    if (e1<0.001)
        break
    end
end 
yk = yk1;
end

%梯形
function yk = do_Trapezoid_Euler(xk_1, xk, yk_1, h)
yk = yk_1;
for s = 1:100
    yk1 = yk + h/2*(Fxy(xk,yk)+Fxy(xk_1,yk_1));
    e1 = abs(yk1-yk);
    if (e1<0.001)
        break
    end
end 
yk = yk1;
end

%中点
function yk = do_Midpoing_Euler(xk_1, yk_2, yk_1, h)
yk = yk_2 + 2*h*Fxy(xk_1,yk_1);
end

%改进
function yk = do_Modified_Euler(xk_1, xk, yk_1, h)
    yk1 = Fxy(xk_1,yk_1);
    yk2 = Fxy(xk_1+h,yk_1+h*yk1);
    yk = yk_1+h*(yk1+yk2)/2;
end

