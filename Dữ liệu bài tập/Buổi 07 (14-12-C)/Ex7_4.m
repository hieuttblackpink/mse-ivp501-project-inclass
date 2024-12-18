%Ex7_4 Hole detection using erosion

clear, clc, close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
FS = 15;

%Load image test
I = imread('fence.jpg');
I = rgb2gray(I); #Convert from RGB to gray scale image
level = graythresh(I);
BW = im2bw(I, level);

%a. Perform the erosion with a diamond radius = 35
se1 = strel('diamond', 35);
BW1 = imerode(I, se1);

%b. Perform the erosion with a defined cross structuring element
length = 101; #50 pixels each side
NHOOD = zeros(length);
NHOOD(ceil(length / 2), :) = 1;
NHOOD(:, ceil(length / 2)) = 1;
se2 = strel('arbitrary', NHOOD);
BW2 = imerode(I, se2);

%Show image
figure(1), clf;
imshow(NHOOD), title('50-pixel cross SE', "fontsize", FS);

%Show image
figure(2), clf;
subplot(2, 2, 1), imshow(I), title('Original image', "fontsize", FS);
subplot(2, 2, 2), imshow(BW), title('Binary image', "fontsize", FS);
subplot(2, 2, 3), imshow(BW1), title('Erosion by diamond image', "fontsize", FS);
subplot(2, 2, 4), imshow(BW2), title('Erosion by cross image', "fontsize", FS);
