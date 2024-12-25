##Ex4. Image Histogram and Equalization

clear, clc, close all;
pkg load image;
FS = 15;

################################################################################
Img = imread('Ex4.jfif');

##1. Given a color image named Ex4.jfif. Plot the original image and its histogram.
## Save this image as ‘Color_Histogram.jpeg’.
figure(1), clf;
subplot(1, 2, 1), imshow(Img), title('Original image', "fontsize", FS);
[count, bins] = imhist(rgb2gray(Img));
subplot(1, 2, 2), bar(bins, count);
set(gca, "fontsize", FS); grid on;
xlim = ([0 255]); ylim = ([0 max(count(:) + 500)]);
xlabel("Gray level"); ylabel("% of pixels");
title('Histogram', "fontsize", FS);

saveas(gcf, 'Color_Histogram.jpeg');

################################################################################

##2. Apply histogram equalization for the original image. Plot the image and its
## histogram after being equalized. Save this figure as ‘Equalization_Histogram.jpeg’.

eq_I = histeq(rgb2gray(Img));

figure(2), clf;
subplot(1, 2, 1), imshow(eq_I), title('Equalized image', "fontsize", FS);
[count, bins] = imhist(eq_I);
bins *= 255;
subplot(1, 2, 2), bar(bins, count);
set(gca, "fontsize", FS); grid on;
xlim = ([0 255]);
xlabel("Gray level"); ylabel("% of pixels");
title('Histogram after equalization', "fontsize", FS);

saveas(gcf, 'Equalization_Histogram.jpeg');

################################################################################

##3. Apply adaptive equalization for the original image with two kernels (default and
## 5x5). Save this figure as ‘Adaptive_Equalization_Histogram.jpeg’

eq_I = histeq(rgb2gray(Img));
lc_I = blockproc(rgb2gray(Img), [5 5], @histeq);

%show images
figure(3), clf;
subplot(2, 3, 1), imshow(Img), title('Original image', "fontsize", FS);
subplot(2, 3, 2), imshow(eq_I), title('Global Equalization', "fontsize", FS);
subplot(2, 3, 3), imshow(lc_I), title('Local Equalization', "fontsize", FS);

[count, bins] = imhist(Img);
subplot(2, 3, 4), bar(bins, count);
set(gca, "fontsize", FS); grid on;
xlim = ([0 255]);
xlabel("Gray level"); ylabel("% of pixels");
title('Histogram before equalization', "fontsize", FS);

[count, bins] = imhist(eq_I);
subplot(2, 3, 5), bar(bins, count);
set(gca, "fontsize", FS); grid on;
xlim = ([0 255]);
xlabel("Gray level"); ylabel("% of pixels");
title('Histogram default equalization', "fontsize", FS);

[count, bins] = imhist(lc_I);
subplot(2, 3, 6), bar(bins, count);
set(gca, "fontsize", FS); grid on;
xlim = ([0 255]);
xlabel("Gray level"); ylabel("% of pixels");
title('Histogram custom equalization (5x5 kernels)', "fontsize", FS);

saveas(gcf, 'Adaptive_Equalization_Histogram.jpeg');
