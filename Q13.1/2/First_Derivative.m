function dF = First_Derivative(Fname, x0, err0)

if (x0==0)
    dx = 1.0e-2; 
else
    dx = 0.1*x0; 
end

dF0 = inf;
K = 1;

while (K<10000)
    f1 = Fname(x0-dx);
    f2 = Fname(x0+dx);
    dF1 = (f2-f1)/2/dx;
    if (abs(dF0-dF1) < err0)
        break;
    end
    dF0 = dF1;
    dx = dx/2;
    K = K+1;
end
dF = dF1;
    