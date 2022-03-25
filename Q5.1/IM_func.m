function [x,HasRoot,k] = IM_func(x0,e)
HasRoot = 0;
k = 0;
while k<10000
    x = func(x0);
    if abs(x-x0)<e
        HasRoot = 1;
        break;
    end
    k = k+1;
    x0 = x;
end