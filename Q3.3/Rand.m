clear; clc;
x=-4:0.01:5

y1 = randn([1 1000]);
figure;
hist(y1,x);

y2 = normrnd(2,0.1,[1 1000]);
figure;
hist(y2,x);