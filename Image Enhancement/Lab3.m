
im = imread('ctscan.jpg');
im_resized = imresize(im, [300 300]);
f = im2double(im_resized);
imagesc(f);
colormap(gray);
colorbar;

[x, y] = meshgrid(1:size(f, 2), 1:size(f, 1));
n = 0.5*sin(0.4*pi*x) + 0.5*sin(0.4*pi*y);
fn = f + n;
imagesc(fn);
colormap(gray);
colorbar;

k = 5;
h = ones(k) / (k^2); % Averaging mask, normalizing so that the sum of its elements is 1
im_denoised = imfilter(fn, h, 'conv');
imagesc(im_denoised);
colormap(gray);
colorbar;


F = fft2(f);
N = fft2(n);
FN = fft2(fn);
F = fftshift(F);
N = fftshift(N);
FN = fftshift(FN);

figure;
subplot(2,2,1);
imshow(log(1 + abs(F)), [])
title('Magnitude Spectrum: f');
subplot(2,2,2);
imshow(log(1 + abs(N)), [])
title('Magnitude Spectrum:  n');
subplot(2,2,3);
imshow(log(1 + abs(FN)), [])
title('Magnitude Spectrum: fn');


uc = 50;
vc = 50;
[m, n] = size(fn);
disp(m);
disp(n);
L = zeros(m, n);
L(m/2-uc:m/2+uc, n/2-vc:n/2+vc) = 1;
figure;
imagesc(L);
colormap(gray);
colorbar;
title('Low Pass Filter');



applied_filter = FN .* L;
applied_filter = ifftshift(applied_filter);
inverse = real(ifft2(applied_filter));
figure;
imagesc(inverse);
colormap(gray);
colorbar;
title('Low Pass Filtered Image');


fg_x = (0:(size(f, 2)-1))/size(f, 2) - 0.5;    %frequency grid x axis
fg_y = (0:(size(f, 1)-1))/size(f, 1) - 0.5;    %frequency grid y axis
[Fx, Fy] = meshgrid(fg_x, fg_y);
F_radius = sqrt(Fx.^2 + Fy.^2);                %compute the radius in the frequency domain 

fc = 0.01; % Cutoff frequency
D = sqrt(Fx.^2 + Fy.^2);
H = 1 - exp(-(D/fc).^2);                       %2D filter H that has a value of 1 for frequencies 
                                               %below a cutoff frequency fc and a value of 0 for frequencies above fc.
band_filter_applied = FN .* H;
inverse_band = real(ifft2(band_filter_applied));
figure;
imshow(inverse_band);
title('Band Limit Filtered Image');



