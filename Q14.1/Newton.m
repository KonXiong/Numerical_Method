% clear;clc;
% x0=0.5; err = 0.001;
% [x,k] = Newton(x0,err)
function [x,k] = Newton(x0,err)
k = 0;
while k<10000
    x = (sin(x0)+cos(x0))/(1+sin(x0));
    if abs(x-x0)<err, break; end
    k = k+1;
    x0 = x;
end