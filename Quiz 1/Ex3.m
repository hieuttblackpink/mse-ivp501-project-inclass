##Ex3. Image Comparison

clear, clc, close all;
pkg load image;
FS = 15;

################################################################################
##1. Given two grayscale images named ‘Ex3a.png’ and ‘Ex3b.png’. Display two
## images in the same figure.
Img_A = imread('Ex3a.png');
Img_B = imread('Ex3b.png');

figure(1), clf;
subplot(1, 2, 1), imshow(Img_A), title('3A Image', "fontsize", FS);
subplot(1, 2, 2), imshow(Img_B), title('3B Image', "fontsize", FS);

################################################################################

##2. Find differences between two images. Enhance contrast increases 40%, brighter 150%.
difference = abs(double(Img_A) - double(Img_B));
difference = uint8(difference);

gamma = 1.4;
enhance_Img = difference .^ gamma;
scale = 1.5;
scaled_Img = enhance_Img .* scale;

figure(2), clf;
subplot(1, 2, 1), imshow(difference), title('Different Image', "fontsize", FS);
subplot(1, 2, 2), imshow(scaled_Img), title('Contrast and brighten different Image', "fontsize", FS);
