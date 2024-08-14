im = imread('medical_image.jpg');
im_gray = rgb2gray(im);
figure
imshow(im_gray);

im_noisy = imnoise(im_gray,'salt & pepper',0.02);
figure
imshow(im_noisy);

%3x3 averaging mask
avg_filter = ones(3, 3)/9;
im_restored = imfilter(im_noisy, avg_filter);
figure
imshow(im_restored);

%5x5 averaging mask
avg_filter = ones(5, 5)/25; 
im_restored = imfilter(im_noisy, avg_filter);
figure
imshow(im_restored);

%3x3 median mask
im_restored = medfilt2(im_noisy, [3 3]);
figure
imshow(im_restored);

%5x5 median mask
im_restored = medfilt2(im_noisy, [5 5]);
figure
imshow(im_restored);

%7x7 median mask
im_restored = medfilt2(im_noisy, [7 7]);
figure
imshow(im_restored);