%Ex5_1 Global Histogram Equalization

clear, clc, close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
%Load image test
#I = imread('brain.jpg');
#I = imread('bay.jpg');
I = imread('moon.jpg');

FS = 15; %Font-size of caption

%show images
figure(1), clf;
subplot(1, 2, 1), imshow(I), title('Original image', "fontsize", FS);
[count, bins] = imhist(I);
subplot(1, 2, 2), bar(bins, count);
set(gca, "fontsize", FS); grid on;
xlim = ([0 255]); ylim = ([0 max(count(:) + 500)]);
xlabel("Gray level"); ylabel("% of pixels");
title('Histogram before equalization', "fontsize", FS);

eq_I = histeq(I);
figure(2), clf;
subplot(1, 2, 1), imshow(eq_I), title('Equalized image', "fontsize", FS);
[count, bins] = imhist(eq_I);
bins *= 255;
subplot(1, 2, 2), bar(bins, count);
set(gca, "fontsize", FS); grid on;
xlim = ([0 255]); %ylim = ([0 max(count(:) + 500)]);
xlabel("Gray level"); ylabel("% of pixels");
title('Histogram after equalization', "fontsize", FS);
