%%区间逐步对分的复合梯形积分
function I = Interval_Halving_Trapz(f,a,b,err)
% a=0;
% b=1;
% err=0.0001;
n = 1;
D = 100;
i = 0;
T1 = (b-a)*(f(a)+f(b))/2;
while (1)
    n = 2*n;
    x = linspace(a,b,n+1);
    h = x(2) - x(1);
    y = f(x);
    T2 = (h/2) * (y(1) + 2*sum(y(2:n)) + y(n+1));
    e0 = abs(T2-T1);
    if (e0<err)
        break
    end
    i = i+1;
    if(i>D)
        break
    end
    T1 = T2;
end
I = T2;
format long
disp('I=');disp(I);
end

% function y = f(x)
% y = 1./(1+x.^2);
% end