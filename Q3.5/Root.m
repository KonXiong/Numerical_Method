clear;clc;
y1 = [1 -3 2 1 2]
y2 = [3 0 2 1 0 7];

r1 = roots(y1) %求根
r2 = roots(y2);

Rr1 = real(r1) %求实根
Ir1 = imag(r1) %求虚根
Z1 = abs(r1) %求模

Rr2 = real(r2);
Ir2 = imag(r2);
Z2 = abs(r2);

