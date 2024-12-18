%Ex7_6 Boundary detection using dilation and erosion

clear, clc, close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
FS = 15;

%Load image test
I = im2double(imread('cliparts.png'));

%Perform dilation and erosion
se = strel('disk', 5, 0);
I_dilated = imdilate(I, se);
I_eroded = imerode(I, se);

%Extract boundary
ext_edge = I_dilated - I;
int_edge = I - I_eroded;
edge = ext_edge + int_edge;

%Show image
figure(1), clf;
subplot(2, 2, 1), imshow(I), title('Original image', "fontsize", FS);
subplot(2, 2, 2), imshow(ext_edge), title('Edge\_1 = External', "fontsize", FS);
subplot(2, 2, 3), imshow(int_edge), title('Edge\_2 = Internal', "fontsize", FS);
subplot(2, 2, 4), imshow(edge), title('Edge\_3 = External + Internal', "fontsize", FS);
