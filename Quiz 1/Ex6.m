##Ex6. Image Restoration – Noise Reduction and Sharpening

clear, clc, close all;
pkg load image;
FS = 15;

################################################################################
Img = imread('Ex6.png');

##1. Read a given grayscale image (‘Ex6.png’). Display the original image and its
## binary format using global and adaptive threshold (3 by 3 kernel).

global_thresh = graythresh(Img);
binary_global = im2bw(Img, global_thresh);

figure(1), clf;
subplot(1, 2, 1), imshow(Img), title('Original Image', "fontsize", FS);
subplot(1, 2, 2), imshow(binary_global), title('Binary global Image', "fontsize", FS);
##subplot(1, 2, 3), imshow(G), title('Green elements Image', "fontsize", FS);

################################################################################

##2. Use the erosion and/or the dilation to detect edges of the objects. The structuring
## element is optional.

I = im2double(binary_global);

se = strel('disk', 1, 0);
I_dilated = imdilate(I, se);
I_eroded = imerode(I, se);

edge = I_dilated - I_eroded;

figure(2), clf;
subplot(1, 2, 1), imshow(Img), title('Original image', "fontsize", FS);
subplot(1, 2, 2), imshow(edge), title('Edge detected image', "fontsize", FS);

################################################################################

##3. Generate a structuring element as below. Could we count the number of coins
## using this structuring element?
custom_se = [
    0 1 1 0;
    1 0 0 1;
    1 0 0 1;
    0 1 1 0
];

I_dilated = imdilate(I, custom_se);
I_eroded = imerode(I, custom_se);

edge = I_dilated - I_eroded;

[L, obj] = bwlabel(I_eroded, 6);
printf("Number of coins detected: %d\n", obj);

figure(3), clf;
subplot(1, 2, 1), imshow(Img), title('Original image', "fontsize", FS);
subplot(1, 2, 2), imshow(edge), title('Edge detected image', "fontsize", FS);
