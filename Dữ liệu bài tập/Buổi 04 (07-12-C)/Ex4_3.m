%Ex4_3 Histogram

clear, clc, close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%pkg load image;
%Load image test
I = imread('bay.jpg');

FS = 15; %Font-size of caption

[count, bins] = imhist(I);

%plot the histogram of the image
subplot(1, 2, 1), imshow(I), title('Original image', "fontsize", FS);
subplot(1, 2, 2), bar(bins, count);
set(gca, "fontsize", FS); grid on;
xlim = ([0 255]); ylim = ([0 max(count(:) + 500)]);
xlabel("Gray level"); ylabel("% of pixels");
