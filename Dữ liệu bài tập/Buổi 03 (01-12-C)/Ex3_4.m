%Ex3_4 Geometric operations

clear, clc, close all;

##########################################################%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;

%1. Flipping an image up-down and left-right
%load test image
##I = imread('atrium.jpg');
##I_ud = flipud(I);
##I_lr = fliplr(I);
##
##
##%Plot images
##FS = 15; %Fontsize of caption
##figure, clf;
##subplot(1, 3, 1), imshow(I), title('Image', "fontsize", FS);
##subplot(1, 3, 2), imshow(I_ud), title('Flipping up-down Image', "fontsize", FS);
##subplot(1, 3, 3), imshow(I_lr), title('Flipping left-right Image', "fontsize", FS);

%2. Rotating an image with angle theta in degree
%load test image
##I = imread('eight.png');
##
##theta = 90; %Angle in degree
##I_r = imrotate(I, theta);
##
##
##%Plot images
##FS = 15; %Fontsize of caption
##figure, clf;
##subplot(1, 2, 1), imshow(I), title('Image', "fontsize", FS);
##subplot(1, 2, 2), imshow(I_r), title('Rotate Image', "fontsize", FS);

%3. Cropping an image
%load test image
##I = imread('mandrill.tif');
##
##x1 = 150; x2 = 450; y1 = 100; y2 = 500;
##xmin = x1; ymin = y1; width = x2 - x1; height = y2 - y1;
##I_c = imcrop(I, [xmin ymin width height]);
##
##
##%Plot images
##FS = 15; %Fontsize of caption
##figure, clf;
##subplot(1, 2, 1), imshow(I), title('Image', "fontsize", FS);
##subplot(1, 2, 2), imshow(I_c), title('Cropped Image', "fontsize", FS);

%3. Zooming an image with different interpolation methods
%load test image
I = imread('bird.jpg');

I_z1 = imresize(I, 2); %by default, bicubic
I_z2 = imresize(I, 2, 'nearest'); %zero-order
I_z3 = imresize(I, 2, 'bilinear'); %first-order


%Plot images
FS = 15; %Fontsize of caption
figure, clf;
subplot(1, 4, 1), imshow(I), title('Image', "fontsize", FS);
subplot(1, 4, 2), imshow(I_z1), title('Bicubic Image', "fontsize", FS);
subplot(1, 4, 3), imshow(I_z2), title('Nearest Image', "fontsize", FS);
subplot(1, 4, 4), imshow(I_z3), title('Bilinear Image', "fontsize", FS);
