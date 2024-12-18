%Ex7_5 Hole removal using closing

clear, clc, close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
FS = 15;

%Load image test
I = imread('man_face.png');

%Binarize the image
BW = I < 112; #Manual threshold = 112

%Perform closing
se = strel('square', 22);
I_dilated = imdilate(BW, se); #Dilation first
I_closed = imerode(I_dilated, se); #Erosion then
I_diff = I_closed - BW;

%Show image
figure(1), clf;
subplot(2, 2, 1), imshow(BW), title('Binary image', "fontsize", FS);
subplot(2, 2, 2), imshow(I_dilated), title('Delated image', "fontsize", FS);
subplot(2, 2, 3), imshow(I_closed), title('Closing image', "fontsize", FS);
subplot(2, 2, 4), imshow(I_diff), title('Closing - Binary', "fontsize", FS);
