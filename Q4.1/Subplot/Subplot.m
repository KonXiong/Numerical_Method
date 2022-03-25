x = linspace(0,1,1000);
y1 = sin(2*pi*2*x);
y2 = exp(x);
h = linspace(0,2*pi,1000);
y3 = sin(h) + cos(h);
y4 = 10*x.^2 - 5*x + 6;
subplot(221), plot(x,y1), grid on, title('sin');
subplot(222), plot(x,y2), grid on, title('exp');
subplot(223), polarplot(h,y3), grid on, title('polar');
subplot(224), semilogy(x,y4), grid on, title('semilogy');