r = [-2 -1 1 3 5];
p = poly(r);
P = p/p(1,size(p,2));  %使常数为1
% r1 = roots(P);
% polyval(p,0);
P = (round(P.*1000))./1000; %保留3位有效数字
fprintf("y=%s\n",poly2str(P,'x')); % poly2sym(P)