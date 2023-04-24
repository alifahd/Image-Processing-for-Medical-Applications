
%im = imread('phantom.gif');
im = imread('ctscan.jpg');
im2 = im2double(im);
%figure, imshow(im2);


%{
theta = 0:179;
R = radon(im2, theta);
imagesc(theta, 1:size(R,1), R);
colormap(gray);
colorbar;



I_reconstructed = iradon(R, theta);
imagesc(I_reconstructed);
colormap(gray);
colorbar;
%}

%{
theta = 0:5:179;
R = radon(im2, theta);
imagesc(theta, 1:size(R,1), R);
colormap(gray);
colorbar;



I_reconstructed = iradon(R, theta);
I_reconstructed1 = iradon(R, theta, 'Shepp-Logan');
I_reconstructed2 = iradon(R, theta, 'Cosine');
I_reconstructed3 = iradon(R, theta, 'Hamming');
I_reconstructed4 = iradon(R, theta, 'Hann');
I_reconstructed5 = iradon(R, theta, 'None');
imagesc(I_reconstructed);
colormap(gray);
colorbar;
%}


theta = 0:20:179;
R = radon(im2, theta);
imagesc(theta, 1:size(R,1), R);
colormap(gray);
colorbar;

%{
I_reconstructed = iradon(R, theta);
I_reconstructed1 = iradon(R, theta, 'Shepp-Logan');
I_reconstructed2 = iradon(R, theta, 'Cosine');
I_reconstructed3 = iradon(R, theta, 'Hamming');
I_reconstructed4 = iradon(R, theta, 'Hann');
I_reconstructed5 = iradon(R, theta, 'None');
imagesc(I_reconstructed);
colormap(gray);
colorbar;
%}
