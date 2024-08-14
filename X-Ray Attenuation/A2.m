x = -2:0.01:2;
y = -2:0.01:2;
[X,Y] = meshgrid(x,y);
h = 1/2*exp(-pi*(X.^2 + (Y.^2)/3));

imagesc(x, y, h);
colormap(gray);
colorbar;
xlabel('Distance, x [mm]');
ylabel('Distance, y [mm]');

fourier(exp(-pi*x.^2))