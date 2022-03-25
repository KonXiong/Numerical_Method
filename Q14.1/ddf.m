% x0 = 1; D = 1000; e0 = 0.001;
% [XX,D1] = ddf(x0,e0,D,[]);
% D1
% XX(D1)
% cos(XX(D1))
function [XX,D1] = ddf(x0,e0,D,Theta)
N = length(x0);
if(D~=-1)
    XX = zeros(N,D);
else 
    XX = [];
end
k=0;
while(1)
    x1 = ddf_fun(x0,Theta);
    XX(:,k+1) = x1;
    e1 = norm(x1-x0);
    if (e1<e0)
        break;
    end
    if (k>=D)
        break;
    end
    k = k+1;
    x0 = x1;
end
D1 = k;
end

function x1 = ddf_fun(x0,Theta)
x1 = cos(x0);
end