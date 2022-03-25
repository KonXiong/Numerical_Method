[X,Y] = meshgrid(-8:.5:8);  %  .5即0.5
R = sqrt(X.^2 + Y.^2) + eps;
Z = sin(R)./R;
figure;
mesh(X,Y,Z);

figure;
surface(X,Y,Z);
view(3);
grid on
