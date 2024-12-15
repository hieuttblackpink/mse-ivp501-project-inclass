%Ex6_5b  noise filtering with additive noisy and blurry image

clear, clc, close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
##pkg load signal;
FS = 15;
%Load image test
I = im2double(imread('eagle.jfif'));

%add blurry effect
LEN = 3; THETA = 5;
PSF = fspecial('motion', LEN, THETA);
blurry_I = imfilter(I, PSF, 'conv', 'symmetric');

%add noise effect
mean = 0; var = 0.01;
noisy_blurred_I = imnoise(blurry_I, 'gaussian', mean, var);

%Show image
figure(1), clf;
subplot(1, 3, 1), imshow(I), title('Original image', "fontsize", FS);
subplot(1, 3, 2), imshow(blurry_I), title('Blurry image', "fontsize", FS);
subplot(1, 3, 3), imshow(noisy_blurred_I), title('Noisy blurry image 2', "fontsize", FS);

%Compare mean square error (MSE) between noisy blurry image and original image
mse1 = 255 * (noisy_blurred_I - I);
##fprintf('MSE before restoration: %.2f\n', rms(mse1(:)));

################################################################################
%Step 1: denoise image
estimator_nr = var / var(I(:));
wnr1 = deconvwnr(noisy_blurred_I, PSF, estimator_nr);
%Step 2: deblur image
h = [0 -1 0; -1 5 -1; 0 -1 0];
wnr2 = deconvwnr(wnr1, h, estimator_nr);

%Show image
figure(2), clf;
subplot(1, 3, 1), imshow(noisy_blurred_I), title('Noisy blurry image 2', "fontsize", FS);
subplot(1, 3, 2), imshow(wnr1), title('Denoise blurry image', "fontsize", FS);
subplot(1, 3, 3), imshow(wnr2), title('Denoise deblurred image', "fontsize", FS);

%Compare mean square error (MSE) between denois deblur image and original image
mse2 = 255 * (wnr2 - I);
fprintf('MSE after restoration: %.2f\n', rms(mse2(:)));
