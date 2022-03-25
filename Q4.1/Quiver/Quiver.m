spacing = 0.2;
[X,Y] = meshgrid(-2:spacing:2);
Z = X.*exp(-X.^2 - Y.^2);
[DX,DY] = gradient(Z,spacing);

quiver(X,Y,DX,DY)
hold on
contour(X,Y,Z)
axis equal
hold off