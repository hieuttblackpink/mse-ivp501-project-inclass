%Ex8_1 Grayscale edge detector

clear, clc, close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
FS = 15;

%Load image test
I = im2double(imread('bike.png'));

%Perform the delation on the original image
se = strel('rectangle', [4 5]);
I_dilated = imdilate(I, se);

%Perform edge detection by subtracting the thresholding
edge = I_dilated - I;
BW = edge > 0.2; %0.2 -> threshold to convert binary

%Show image
figure(1), clf;
subplot(2, 2, 1), imshow(I), title('Original image', "fontsize", FS);
subplot(2, 2, 2), imshow(I_dilated), title('Dilated image', "fontsize", FS);
subplot(2, 2, 3), imshow(edge), title('Edge = Dilation - Origin', "fontsize", FS);
subplot(2, 2, 4), imshow(BW), title('BW of edge', "fontsize", FS);
