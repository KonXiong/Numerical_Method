clear;clc;
p4 = Generate(4); %调用方法运算多项式系数值
p6 = Generate(6);
p8 = Generate(8);
p100 = Generate(100);

xcos = cos(pi/3)
xp4 = polyval(p4,pi/3)  %代入数值得出结果
xp6 = polyval(p6,pi/3)
xp8 = polyval(p8,pi/3)
xp100 = polyval(p100,pi/3)

