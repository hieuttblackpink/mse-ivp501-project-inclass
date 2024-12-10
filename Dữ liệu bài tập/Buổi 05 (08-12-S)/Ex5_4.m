%Ex5_4 Convolution between an image and a simple filter

clear, clc, close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
%Load image test
I = im2double(imread('airplane.png'));

FS = 15; %Font-size of caption

%Constract three different filters
h1 = ones(1, 10) / 10; %horizontal filter
h2 = ones(10, 1) / 10; %vertical filter
h3 = ones(10) / 100; %box/windown filter

%perform filtering on the noisy image
filtered_I1 = imfilter(I, h1, 'symetric');
filtered_I2 = imfilter(I, h2, 'replicate');
filtered_I3 = imfilter(I, h3, 'circular');

%show images
figure(1), clf;
subplot(1, 2, 1), imshow(I), title('Original image', "fontsize", FS);
subplot(1, 2, 2), imshow(filtered_I1), title('Horizontal filtering', "fontsize", FS);


figure(2), clf;
subplot(1, 2, 1), imshow(I), title('Original image', "fontsize", FS);
subplot(1, 2, 2), imshow(filtered_I2), title('Vertical filtering', "fontsize", FS);


figure(3), clf;
subplot(1, 2, 1), imshow(I), title('Original image', "fontsize", FS);
subplot(1, 2, 2), imshow(filtered_I3), title('Box filtering', "fontsize", FS);

