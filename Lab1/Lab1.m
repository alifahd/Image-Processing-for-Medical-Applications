im = imread('medical_image.jpg');
imfinfo('medical_image.jpg');
whos im;
im_gray = rgb2gray(im);
%imwrite (im_gray, 'medical_image_gray.jpg');
whos im_gray;

%figure, imhist(im_gray);

%im_gray_pdf=imhist(im_gray)/numel(im_gray);
%figure, imhist(im_gray_pdf);

%Im_gray_cdf=cumsum(im_gray_pdf);
%figure, imhist(Im_gray_cdf);

%E = entropy(im_gray);

%im_gray_c = imcrop(im_gray, [60 500 180 140]);

%imeq = histeq(im_gray);
%figure, imhist(imeq);

%figure, imhist(im_gray_c);
%imeq = histeq(im_gray_c);
%figure, imhist(imeq);
