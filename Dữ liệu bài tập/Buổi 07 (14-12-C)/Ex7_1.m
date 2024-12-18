%Ex7_1 Dilation

clear, clc, close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
FS = 15;

%Load image test
I = imread('binary_objects.jpg');

%Perform the dilation with some different structuring elements (SEs)
%a. Small disk with radius = 5
se1 = strel('disk', 5, 0);
BW1 = imdilate(I, se1);

%b. Large disk with radius = 5
se2 = strel('disk', 15, 0);
BW2 = imdilate(I, se2);

%c. Square with side = 7
se3 = strel('square', 7);
BW3 = imdilate(I, se3);

%d. Rectangle with 2 dimensions 5 x 10
se4 = strel('rectangle', [5 10]);
BW4 = imdilate(I, se4);

%d. Dinamond with radius = 4
se5 = strel('diamond', 4);
BW5 = imdilate(I, se4);

%d. Line with length = 10 and inclined angle = 45
se6 = strel('line', 10, 45);
BW6 = imdilate(I, se6);

%Show image
figure(1), clf;
subplot(2, 3, 1), imshow(BW1), title('Dilation by small disk image', "fontsize", FS);
subplot(2, 3, 2), imshow(BW2), title('Dilation by large disk image', "fontsize", FS);
subplot(2, 3, 3), imshow(BW3), title('Dilation by square image', "fontsize", FS);
subplot(2, 3, 4), imshow(BW4), title('Dilation by rectangle image', "fontsize", FS);
subplot(2, 3, 5), imshow(BW5), title('Dilation by diamond image', "fontsize", FS);
subplot(2, 3, 6), imshow(BW6), title('Dilation by line image', "fontsize", FS);
