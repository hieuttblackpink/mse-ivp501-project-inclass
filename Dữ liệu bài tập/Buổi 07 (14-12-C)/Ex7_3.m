%Ex7_3 Circle counting using erosion

clear, clc, close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
FS = 15;

%Load image test
I = imread('circles.png');

%Perform erosion
%a. with a square side = 45
se1 = strel('square', 45);
BW1 = imerode(I, se1);

%b. with a disk radius = 50
se2 = strel('disk', 50, 0);
BW2 = imerode(I, se2);

%c. with a rectangle 2 dimensions = 35 x 45
se3 = strel('rectangle', [35 45]);
BW3 = imerode(I, se3);

%d. with a diamond radius = 45
se4 = strel('diamond', 45);
BW4 = imerode(I, se4);

%e. with a line length = 30, incline angle = 45
se5 = strel('line', 30, 45);
BW5 = imerode(I, se5);

%Show image
figure(1), clf;
subplot(2, 3, 1), imshow(BW1), title('Erosion by square image', "fontsize", FS);
subplot(2, 3, 2), imshow(BW2), title('Erosion by disk image', "fontsize", FS);
subplot(2, 3, 3), imshow(BW3), title('Erosion by rectangle image', "fontsize", FS);
subplot(2, 3, 4), imshow(BW4), title('Erosion by diamond image', "fontsize", FS);
subplot(2, 3, 5), imshow(BW5), title('Erosion by line image', "fontsize", FS);
subplot(2, 3, 6), imshow(I), title('Original image', "fontsize", FS);
