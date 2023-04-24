im = imread('asn4.tif');
se = strel('line', 55, 0);
open = imopen(im, se);
figure
imshow(open);

se = strel('line', 110, 0);
open = imopen(im, se);
figure
imshow(open);

se = strel('line', 30, 90);
open = imopen(im, se);
figure
imshow(open);

se1 = strel('line', 55, 45);
se2 = strel('line', 55, 135);
open1 = imopen(im, se1);
open2 = imopen(im, se2);
figure
imshow(max(open1, open2));