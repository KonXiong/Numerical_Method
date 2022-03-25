clear; clc;
t = 0:1/16:100;
x = sin(t) .* (exp(cos(t))-2*cos(4*t)-(sin(t/12)).^5);
y = cos(t) .* (exp(cos(t))-2*cos(4*t)-(sin(t/12)).^5);
figure;
subplot(2,2,1);
plot(t,x);
title('Subplot 1: x-t');

subplot(2,2,2);
plot(t,y);
title('Subplot 2: y-t');

subplot(2,2,[3,4]);
plot(x,y);
title('Subplot 3: y-x');