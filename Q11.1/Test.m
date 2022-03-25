clear;clc;

f = @(x)1./(1+x.^2);

for i=1:4 
    eval (['T' num2str(i) '=Trapz(f,0,1,' num2str(i) ');']);
end

S1 = Simpson(f,0,1,2); 
S2 = Simpson(f,0,1,4);

K4 = Newton_Cotes(f,0,1,5,8);

format long
disp('T1');disp(T1);
disp('T2');disp(T2);
disp('T3');disp(T3);
disp('T4');disp(T4);
disp('S1');disp(S1);
disp('S2');disp(S2);
disp('K4');disp(K4);

