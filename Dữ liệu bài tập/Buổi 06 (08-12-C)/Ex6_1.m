%Ex6_1 Noise mean filtering

clear, clc, close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
FS = 15;
%Load image test
I = imread('coins.tif');

%Add gaussian noise to the original image
I_noise = imnoise(I, 'gaussian', 0, 0.05);

%Show image
figure(1), clf;
subplot(1, 2, 1), imshow(I), title('Original image', "fontsize", FS);
subplot(1, 2, 2), imshow(I_noise), title('Noisy image', "fontsize", FS);

%Apply an averaging filter using 2 different kenel sizes
%a. Default kernel 3x3
f1 = fspecial('average');
I_denoise1 = imfilter(I_noise, f1);

%b. Defined kernel 5x5
f2 = fspecial('average', [5 5]);
I_denoise2 = imfilter(I_noise, f2);

%Show image
figure(2), clf;
subplot(1, 2, 1), imshow(I_denoise1), title('Denoise with 3x3 kernel image', "fontsize", FS);
subplot(1, 2, 2), imshow(I_denoise2), title('Denoise with 5x5 kernel image', "fontsize", FS);
