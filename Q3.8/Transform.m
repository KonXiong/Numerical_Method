C = [1 9 26 24];
N = [1 15 77 153 90];
a = roots(C);
b = roots(N);

fprintf("C(s) = (s%.1f)(s%.1f)(s%.1f)\n",a(1),a(2),a(3));
fprintf("N(s) = (s%.1f)(s%.1f)(s%.1f)(s%.1f)\n",b(1),b(2),b(3),b(4));
