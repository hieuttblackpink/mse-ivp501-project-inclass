%Ex7_2 Erosion

clear, clc, close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
FS = 15;

%Load image test
I = imread('binary_objects.jpg');

%Perform the dilation with some different structuring elements (SEs)
%a. Small disk with radius = 5
se1 = strel('disk', 5, 0);
BW1 = imerode(I, se1);

%b. Large disk with radius = 15
se2 = strel('disk', 15, 0);
BW2 = imerode(I, se2);

%c. Square with side = 7
se3 = strel('square', 7);
BW3 = imerode(I, se3);

%d. Rectangle with 2 dimensions 5 x 10
se4 = strel('rectangle', [5 10]);
BW4 = imerode(I, se4);

%d. Dinamond with radius = 4
se5 = strel('diamond', 4);
BW5 = imerode(I, se4);

%d. Line with length = 10 and inclined angle = 45
se6 = strel('line', 10, 45);
BW6 = imerode(I, se6);

%Show image
figure(1), clf;
subplot(2, 3, 1), imshow(BW1), title('Erosion by small disk image', "fontsize", FS);
subplot(2, 3, 2), imshow(BW2), title('Erosion by large disk image', "fontsize", FS);
subplot(2, 3, 3), imshow(BW3), title('Erosion by square image', "fontsize", FS);
subplot(2, 3, 4), imshow(BW4), title('Erosion by rectangle image', "fontsize", FS);
subplot(2, 3, 5), imshow(BW5), title('Erosion by diamond image', "fontsize", FS);
subplot(2, 3, 6), imshow(BW6), title('Erosion by line image', "fontsize", FS);
