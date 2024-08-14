im = imread('medical_image.jpg');
im_gray = rgb2gray(im);
im2 = im2double(im_gray);
imshow(im2);

PSF = fspecial('motion',21,11); %linear motion across 21 pixels at an angle of 11 degrees
blurred_img = imfilter(im2, PSF, 'conv', 'circular');
imshow(blurred_img);

signal_var = var(im2(:));
noise_var = 0.0001;
NSR = noise_var / signal_var;
restored_img =  deconvwnr(blurred_img, PSF, NSR);
imshow(restored_img);

noise_mean = 0;
noise_var = 0.0001;
blurred_noisy = imnoise(blurred_img,'gaussian',noise_mean,noise_var);
imshow(blurred_noisy)
title('Blurred and Noisy Image')

uniform_quantization_var = (1/256)^2 / 12;
signal_var = var(im2(:));
NSR = uniform_quantization_var / signal_var;
wnr5 = deconvwnr(blurred_noisy,PSF,0.001138);
figure
imshow(wnr5);
disp(NSR);

K_range = 0:0.01:1;

% Initialize variables
min_mse = Inf;
best_K = 0;
mse_values = zeros(size(K_range));

% Iterate over the range of K values
for i = 1:length(K_range)
    % Calculate the restored image using the current K value
    restored_img = deconvwnr(blurred_noisy, PSF, K_range(i));

    % Calculate the MSE between the original and restored image
    mse_values(i) = immse(im2, restored_img);

    % Check if the current MSE is the lowest so far
    if mse_values(i) < min_mse
        min_mse = mse_values(i);
        best_K = K_range(i);
    end
end

% Plot the MSE values as a function of K
figure;
plot(K_range, mse_values);
xlabel('K');
ylabel('MSE');

% Display the best K value and its corresponding MSE
fprintf('Best K value: %.2f\n', best_K);
fprintf('Minimum MSE: %.6f\n', min_mse);