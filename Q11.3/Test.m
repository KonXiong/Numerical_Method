clear;clc;
f=@(x) 1./(1+x.^2);
a=0; b=1; es=10e-5; maxit=6;
[q,ea,iter] =  romberg(f,a,b,es,maxit);
disp('q=');disp(q);
disp('ea=');disp(ea);
disp('iter=');disp(iter);


