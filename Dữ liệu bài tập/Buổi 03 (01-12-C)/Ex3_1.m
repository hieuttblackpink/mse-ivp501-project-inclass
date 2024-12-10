%Ex3_1 Adding 2 images

clear, clc, close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%pkg load image;
%load test image
IA = imread('prarie.jpg');
IB = imread('giraffe.jpg');
IB_Resize = imresize(IB, [size(IA, 1) size(IA, 2)]);
IC = imadd(IA, IB_Resize);

%Plot images
FS = 15; %Fontsize of caption
figure, clf;
subplot(1, 3, 1), imshow(IA), title('Image 1', "fontsize", FS);
subplot(1, 3, 2), imshow(IB), title('Image 2', "fontsize", FS);
subplot(1, 3, 3), imshow(IC), title('Combination Image', "fontsize", FS);
