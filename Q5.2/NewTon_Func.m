function [x,HasRoot] = NewTon_Func(x0)
HasRoot = 0;
k = 0;
err0 = 0.0001;
err1 = 0.0001;
f = @Test_Func;
while k<10000
    x = x0 - f(x0)/First_Derivative(f,x0,err0);
    if abs(x-x0)<err1
        HasRoot = 1;
        break;
    end
    k = k+1;
    x0 = x;
end