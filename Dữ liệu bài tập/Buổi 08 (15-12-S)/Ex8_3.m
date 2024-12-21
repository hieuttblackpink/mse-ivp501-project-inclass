%Ex8_3

clear, clc, close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
FS = 15;

%Load image test
I = imread('butterfly.png');

%Define 3 differents structuring elements
se1 = strel('line', 10, 0);
se2 = strel('line', 10, 45);
se3 = strel('line', 10, 90);

%Perform a sequence of dilation
I_dilation1 = imdilate(I, se1);
I_dilation2 = imdilate(I_dilation1, se2);
I_dilation3 = imdilate(I_dilation2, se3);

%Show image
figure(1), clf;
subplot(2, 2, 1), imshow(I), title('Original image', "fontsize", FS);
subplot(2, 2, 2), imshow(I_dilation1), title('1st dilation image', "fontsize", FS);
subplot(2, 2, 3), imshow(I_dilation2), title('2nd dilation image', "fontsize", FS);
subplot(2, 2, 4), imshow(I_dilation3), title('3rd dilation image', "fontsize", FS);
