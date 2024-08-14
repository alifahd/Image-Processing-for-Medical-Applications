I = imread('lab5a.tif');
threshold = 0.5;
BW = imbinarize(I, threshold);
figure
imshow(BW);

L = bwlabel(BW);
RGB = label2rgb(L);
figure
imshow(RGB);

stats = regionprops('table', RGB, 'Area');
areas = stats.Area;
figure
histogram(areas);
xlabel('Object Area');
ylabel('Frequency');
title('Object Area Distribution');

I = imread('lab5b.tif');
threshold = 0.5;
BW = imbinarize(I, threshold);
BW = medfilt2(BW, [5 5]);
figure
imshow(BW);

L = bwlabel(BW);
RGB = label2rgb(L);
figure
imshow(RGB);

stats = regionprops('table', RGB, 'Area');
areas = stats.Area;
figure
histogram(areas);
xlabel('Object Area');
ylabel('Frequency');
title('Object Area Distribution');