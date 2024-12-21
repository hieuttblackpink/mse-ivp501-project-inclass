%Ex8_4 Change object's feature of color image

clear, clc, close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
FS = 15;

%Load image test
I = imread('shapes.png');

%Convert to grayscale image
I_grayscale = rgb2gray(I);
%Binary the grayscale image
level = graythresh(I_grayscale);
I_BW = 1 - im2bw(I_grayscale, level);

%Change object color
[L, obj] = bwlabel(I_BW, 6);
%Circle -> red, Square -> magenta, Rectangle -> yellow, Asterisk = cyan, Pentagon -> black
cmap = [255 0 0; 255 0 255; 255 255 0; 0 255 255; 0 0 0];
rgbLable = label2rgb(L, cmap);

%Show image
figure(1), clf;
subplot(2, 2, 1), imshow(I), title('Original image', "fontsize", FS);
subplot(2, 2, 2), imshow(I_grayscale), title('Grayscale image', "fontsize", FS);
subplot(2, 2, 3), imshow(I_BW), title('Binary image', "fontsize", FS);
subplot(2, 2, 4), imshow(rgbLable), title('Converted color image', "fontsize", FS);

