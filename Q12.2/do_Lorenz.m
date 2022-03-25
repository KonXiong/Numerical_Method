clear;clc;
% function do_Lorenz
[t,y] = ode45(@Lorenz,[0,30],[12,2,9]);
figure
subplot(221);
plot(t,y(:,1));
grid on;
xlabel('t');
ylabel('x');

subplot(222);
plot(t,y(:,2));
grid on;
xlabel('t');
ylabel('y');

subplot(223);
plot(t,y(:,3));
grid on;
xlabel('t');
ylabel('z');

subplot(224);
plot3(y(:,1),y(:,2),y(:,3));
grid on

function dy = Lorenz(~,y)
dy = zeros(3,1);
dy(1) = 10*(-y(1)+y(2));
dy(2) = 28*y(1)-y(2)-y(1)*y(3);
dy(3) = y(1)*y(2)-8*y(3)/3;
end