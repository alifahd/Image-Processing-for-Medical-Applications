im = imread('medical_image.jpg');
im_gray = rgb2gray(im);
figure
imshow(im_gray);

im_noisy = imnoise(im_gray, 'gaussian',0,0.025);
figure
imshow(im_noisy);

%5x5 averaging mask
avg_filter = ones(5, 5)/25; 
im_restored = imfilter(im_noisy, avg_filter);
figure
imshow(im_restored);

%Sharpening image
im_double_noise = im2double(im_restored);
lap = [-1 -1 -1; -1 8 -1; -1 -1 -1];
add = imfilter(im_double_noise, lap);
sharpened = im_double_noise + add;
figure
imshow(sharpened);
