%Ex2_3 Brightness adjustment

clear, clc, close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%load test image
Img = im2double(imread('tiger.jpg'));

%Brightness adjustment by an intansity sealling
scale = 3; %Scale = 1.0 -> unchange. Scale < 1 -> darker. Scale > 1 -> brighter
scaled_Img = Img .* scale;

%Plot image
FS = 15;

figure, clf;
subplot(1, 2, 1), imshow(Img, [0 1]), title('Original Image', "fontsize", FS);
subplot(1, 2, 2), imshow(scaled_Img, [0 1]), title('Scaled Image', "fontsize", FS);

