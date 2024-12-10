%Ex2_5 Brightness adjustment for color image

clear, clc, close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
%load test image
Img = imread('sunset.jpg');

%Brighten all 3 layers RGB
I1(:,:,1) = imadd(Img(:,:,1), 100); %Red component
I1(:,:,2) = imadd(Img(:,:,2), 175); %Green component
I1(:,:,3) = imadd(Img(:,:,3), 225); %Blue component

%Darken all 3 layers RGB
I2(:,:,1) = imsubtract(Img(:,:,1), 120); %Red component
I2(:,:,2) = imsubtract(Img(:,:,2), 80); %Green component
I2(:,:,3) = imsubtract(Img(:,:,3), 40); %Blue component

%Plot image
FS = 15;

figure, clf;
subplot(1, 3, 1), imshow(Img), title('Original Image', "fontsize", FS);
subplot(1, 3, 2), imshow(I1), title('Brighten 3-layer image', "fontsize", FS);
subplot(1, 3, 3), imshow(I2), title('Darken 3-layer image', "fontsize", FS);