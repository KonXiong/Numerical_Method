% a=0.5; b=1; e0=0.001; D=1000; ff='eff_func';
% [x0,D1] = eff(a,b,e0,D,ff);
% D1
% x0
function [x0,D1] = eff(a,b,e0,D,ff)
x0 = Inf; D1 = 0;
ay = feval(ff,a); by = feval(ff,b);
if (ay*by>0),return; end
while (1)
    x0 = (a+b)/2; y0 = feval(ff,x0);
    if (y0*ay > 0), a= x0; ay = y0; else b = x0; by = y0; end
    D1 = D1+1;
    if (D1>D), break; end
    if (norm(a-b) < e0), break; end
end
end

function y = eff_func(x)
y = x - cos(x);
end