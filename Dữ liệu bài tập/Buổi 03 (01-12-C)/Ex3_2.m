%Ex3_2 Multiplying 2 or more images

clear, clc, close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%pkg load image;
%load test image
I1 = im2double(imread('earth1.jpg'));
I2 = im2double(imread('earth2.jpg'));
I = immultiply(immultiply(I1, I2), immultiply(I1, I2));

%Plot images
FS = 15; %Fontsize of caption
figure, clf;
subplot(1, 2, 1), imshow(I1), title('2D Image', "fontsize", FS);
subplot(1, 2, 2), imshow(I), title('3D Image', "fontsize", FS);
