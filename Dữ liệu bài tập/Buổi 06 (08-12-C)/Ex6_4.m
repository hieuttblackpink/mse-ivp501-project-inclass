%Ex6_4 Image sharpening

clear, clc, close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
FS = 15;
%Load image test
##I = im2double(imread('duck.png'));
I = im2double(imread('street.jfif'));

%Apply 3 diferent 3x3 sharpening filters to the degraded image
h1 = [0 -1 0; -1 10 -1; 0 -1 0] / 4;
h2 = [0 -1 0; -1 5 -1; 0 -1 0];

I_sharpened1 = imfilter(I, h1, 'replicate');
I_sharpened2 = imfilter(I, h2, 'replicate');

%Show image
figure(1), clf;
subplot(1, 3, 1), imshow(I), title('Original image', "fontsize", FS);
subplot(1, 3, 2), imshow(I_sharpened1), title('Sharpening image 1', "fontsize", FS);
subplot(1, 3, 3), imshow(I_sharpened2), title('Sharpening image 2', "fontsize", FS);
