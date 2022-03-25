% A=[1 2 1; 2 1 2; 3 4 2]
% x0=rand(size(A,1),1); D=1000; e0=0.001;
[Lamda,V1,D1] = mifa(x0,e0,D,A);
D1
Lamda
V1
eig(A)
function [Lamda,V1,D1] = mifa(x0,e0,D,Theta)
Lamda0 = 1;
k = 0;
while (1)
    x1 = Theta * x0;
    Lamda = mean(x1./x0);
    if (k>1)
        e1 = norm(Lamda-Lamda0);
    else
        e1 = e0+1;
    end
    if (e1<e0) break; end
    if (k>=D) break; end
    k = k+1;
    x0 = x1;
    Lamda0 = Lamda;
end
D1 = k;
V1 = x1/max(abs(x1));
end