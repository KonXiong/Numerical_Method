clear;clc;
x = linspace(0,1,100);
y = sin(2*pi*x);
z = cos(2*pi*2*x);
plot(x,y,x,z,'r--','Linewidth', 1.5,'Linewidth', 1.5);
% plot(x,y,'-','Linewidth', 1.5,'color',[102,194,165]/255);
% hold on;
% plot(x,z,'--','Linewidth', 1.5,'color',[252,141,98]/255);
grid on;
set(gca,'LineWidth',2);
% set(gca, 'linewidth', 1.1, 'fontsize', 16, 'fontname', 'STFangSong');
set(gca, 'linewidth', 1.1, 'fontsize', 16, 'fontname', 'STFangSong');
title('两条直线');
xlabel('x轴');
ylabel('y轴');
legend('sin曲线','cos曲线');