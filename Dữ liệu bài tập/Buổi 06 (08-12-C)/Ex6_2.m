%Ex6_2 Noise salt/pepper filtering

clear, clc, close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
FS = 15;
%Load image test
I = im2double(imread('coins.tif'));
I_salt = im2double(imread('coins_salt.jpg'));
I_pepper = im2double(imread('coins_pepper.jpg'));

%Show image
figure(1), clf;
subplot(1, 3, 1), imshow(I), title('Original image', "fontsize", FS);
subplot(1, 3, 2), imshow(I_salt), title('Salt noise image', "fontsize", FS);
subplot(1, 3, 3), imshow(I_pepper), title('Pepper noise image', "fontsize", FS);

%Filter noise image
I_fix1 = colfilt(I_salt, [4 4], 'sliding', @min);
I_fix2 = colfilt(I_pepper, [4 4], 'sliding', @max);
I_fix3 = colfilt(I_salt, [4 4], 'sliding', @max);

%Show image
figure(2), clf;
subplot(1, 3, 1), imshow(I_fix1), title('Salt denoise image', "fontsize", FS);
subplot(1, 3, 2), imshow(I_fix2), title('Pepper denoise image', "fontsize", FS);
subplot(1, 3, 3), imshow(I_fix3), title('Salt wrongly denoise image', "fontsize", FS);
