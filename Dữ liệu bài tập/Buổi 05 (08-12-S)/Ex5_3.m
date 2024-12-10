%Ex5_2 Adaptive Histogram Equalization

clear, clc, close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
%Load image test
I = imread('parrot.jpg');

FS = 15; %Font-size of caption

%Perform global histogram equalization
eq_I = histeq(I);

%Perform local histogram equalization
lc_I = blockproc(I, [200 200], @histeq);

%show images
figure(1), clf;
subplot(1, 3, 1), imshow(I), title('Original image', "fontsize", FS);
subplot(1, 3, 2), imshow(eq_I), title('Global Equalization', "fontsize", FS);
subplot(1, 3, 3), imshow(lc_I), title('Local Equalization', "fontsize", FS);

%
figure(2), clf;

[count, bins] = imhist(I);
subplot(1, 3, 1), bar(bins, count);
set(gca, "fontsize", FS); grid on;
xlim = ([0 255]); %ylim = ([0 max(count(:) + 500)]);
xlabel("Gray level"); ylabel("% of pixels");
title('Histogram before equalization', "fontsize", FS);

[count, bins] = imhist(eq_I);
subplot(1, 3, 2), bar(bins, count);
set(gca, "fontsize", FS); grid on;
xlim = ([0 255]); %ylim = ([0 max(count(:) + 500)]);
xlabel("Gray level"); ylabel("% of pixels");
title('Histogram after global equalization', "fontsize", FS);

[count, bins] = imhist(lc_I);
subplot(1, 3, 3), bar(bins, count);
set(gca, "fontsize", FS); grid on;
xlim = ([0 255]); %ylim = ([0 max(count(:) + 500)]);
xlabel("Gray level"); ylabel("% of pixels");
title('Histogram after local equalization', "fontsize", FS);
