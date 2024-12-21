%Ex8_2 Coins couting using dilation

clear, clc, close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
FS = 15;

%Load image test
I = imread('coins.png');

%Binary the input image
level = graythresh(I);
BW = 1 - im2bw(I, level); %Revert black and white

%a. No dilation
[L, obj] = bwlabel(BW, 6);
rgbLabel1 = label2rgb(L, 'jet', 'k');
printf("Number of coins before dilation: %d\n", obj);

%b. use dilation
se = strel('disk', 25, 0);
BW_dilated = 1 - imdilate(im2bw(I, level), se);

[L2, obj2] = bwlabel(BW_dilated, 6);
rgbLabel2 = label2rgb(L2, 'jet', 'k');
printf("Number of coins after dilation: %d\n", obj2);

%Show image
figure(1), clf;
subplot(2, 2, 1), imshow(I), title('Original image', "fontsize", FS);
subplot(2, 2, 2), imshow(BW), title('Binary image', "fontsize", FS);
subplot(2, 2, 3), imshow(rgbLabel1), title('Labeling before dilation image', "fontsize", FS);
subplot(2, 2, 4), imshow(rgbLabel2), title('Labeling after dilation image', "fontsize", FS);
