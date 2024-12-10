%Ex2_1 Read and Write an image

clear, clc, close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
%load test image
Img = imread('nature_default.jpg'); %Return unsign integer (0 -> 255)
Img_grayscale = rgb2gray(Img);
Img_bw = im2double(im2bw(Img_grayscale, 0.5));

%Plot images
FS = 15; %Fontsize of caption
figure, clf;
subplot(1, 3, 1), imshow(Img), title('Original Image', "fontsize", FS);
subplot(1, 3, 2), imshow(Img_grayscale), title('Grayscale Image', "fontsize", FS);
subplot(1, 3, 3), imshow(Img_bw), title('Binary Image', "fontsize", FS);

%Save image
saveas(gcf, 'Image Representations.png'); %gcf: Get current figure -> Save current figure into work folder

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Save the origin image with different qualities
imwrite(Img, 'nature_100.jpg'); %Save as default
imwrite(Img, 'nature_75.jpg', 'quality', 75); %Save as 75%
imwrite(Img, 'nature_10.jpg', 'quality', 10); %Save as 10%
