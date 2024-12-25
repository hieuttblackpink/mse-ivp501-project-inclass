##Ex5. Image Restoration – Noise Reduction and Sharpening

clear, clc, close all;
pkg load image;
FS = 15;

################################################################################
Img = imread('Ex5.png');

##1. Read a given noisy color image (‘Ex5.png’). Display the original image in color
## and grayscale format.
gray_Img = rgb2gray(Img);

figure(1), clf;
subplot(1, 2, 1), imshow(Img), title('Original Image', "fontsize", FS);
subplot(1, 2, 2), imshow(gray_Img), title('Grayscale Image', "fontsize", FS);

################################################################################

##2. Using a two-dimensional LPF to denoise the original image. Parameters of the
## filter are optional.
h = fspecial('gaussian', [5 5], 1);

denoise_Img = imfilter(gray_Img, h, 'symmetric');
figure(2), clf;
subplot(1, 3, 1), imshow(Img), title('Original Image', "fontsize", FS);
subplot(1, 3, 2), imshow(gray_Img), title('Grayscale Image', "fontsize", FS);
subplot(1, 3, 3), imshow(denoise_Img), title('Denoised Image', "fontsize", FS);

################################################################################

##3. Using two filters to sharpen the denoise image. Parameters are optional
h1 = [0 -1 0; -1 10 -1; 0 -1 0] / 4;
h2 = [0 -1 0; -1 5 -1; 0 -1 0];

I_sharpened1 = imfilter(denoise_Img, h1, 'replicate');
I_sharpened2 = imfilter(denoise_Img, h2, 'replicate');

figure(3), clf;
subplot(1, 3, 1), imshow(Img), title('Original image', "fontsize", FS);
subplot(1, 3, 2), imshow(I_sharpened1), title('Sharpening image 1', "fontsize", FS);
subplot(1, 3, 3), imshow(I_sharpened2), title('Sharpening image 2', "fontsize", FS);
