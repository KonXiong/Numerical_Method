clear;clc;
f = @(x)1./(1+x.^2);
a=0; b=1; n=64;

y = pi/4;
T64 = ComTrapz(f,a,b,n);
S32 = ComSimpson(f,a,b,n);

err1 = abs(T64 - y) ;
err2 = abs(S32 - y);

format long
disp('T64=');disp(T64);
disp('S32=');disp(S32);
disp('err1=');disp(err1);
disp('err2=');disp(err2);

%区间逐步对分的复合梯形积分
err=0.0001;
IHT = Interval_Halving_Trapz(f,a,b,err);
disp('IHT=');disp(IHT);