%Ex2_4 Contrast enhancement

clear, clc, close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%load test image
Img = imread('waterfall.jpg');

%Contrast enhancement by changing the 'gama' characteristic
gamma = 0.8; %Gamma = 1.0 -> unchange. Gamma < 1 -> decrease. Gamma > 1 -> increase
enhanced_Img = Img .^ gamma;

%Plot image
FS = 15;

figure, clf;
subplot(1, 2, 1), imshow(Img, [0 1]), title('Original Image', "fontsize", FS);
subplot(1, 2, 2), imshow(enhanced_Img, [0 1]), title('Contrast enhancement', "fontsize", FS);


