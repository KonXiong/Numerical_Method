clear; clc;
theta = 1:1/16:100;
rho = exp(sin(theta)) - 2*cos(4*theta) - (sin((2*theta-pi)/24)).^5;
figure;
polar(theta,rho);
title('Butterfly in Polar');
xlabel('theta');
ylabel('rho'); %polarplot不支持xlabel和ylabel
legend('蝴蝶线');