%Ex3_3 Dividing 2 images

clear, clc, close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%pkg load image;
%load test image
noText = im2double(imread('gradient.jpg'));
haveText = im2double(imread('gradient_with_text.jpg'));
D = imdivide(double(haveText), double(noText));
D = D > 1;

%Plot images
FS = 15; %Fontsize of caption
figure, clf;
subplot(1, 3, 1), imshow(noText), title('No text Image', "fontsize", FS);
subplot(1, 3, 2), imshow(haveText), title('Have text Image', "fontsize", FS);
subplot(1, 3, 3), imshow(D), title('Text Image', "fontsize", FS);
