%Ex10_3 Hough Transform Application
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%load test image
Img = imread('paper.jpg');

pkg load image;
%binarize the input image
level = graythresh(Img);
bw_Img = 1 - im2bw(Img, level);
col = size(bw_Img, 2);

%show images
FS = 15; %fontsize of caption
figure(1), clf;
subplot(1, 2, 1), imshow(Img), title('Original Image', "fontsize", FS);
subplot(1, 2, 2), imshow(bw_Img), title('Binary Image', "fontsize", FS);
saveas(1, 'Origin and Binary Images.png');

%compute Hough transform
[H, theta, rho] = hough(bw_Img, 'Theta', -90 : 1 : 90, 'RhoResolution', 1);
figure(2), clf;
imagesc(theta, rho, H); axis on, axis normal, hold on;
colormap(hot), colorbar;
set(gca, "fontsize", FS);
saveas(2, 'Hough Transform Computation.png');

%detect peaks in Hough transform
peakNum = 6;
P = houghpeaks(H, peakNum, 'threshold', ceil(0.2*max(H(:))));
lines = houghlines(bw_Img, theta, rho, P, 'FillGap', 5, 'MinLength', 1);
thetaPeaks = theta(P(:,2)); rhoPeaks = rho(P(:,1));
plot(thetaPeaks, rhoPeaks, 'o', 'color', 'Y', 'LineWidth', 1.5);

%rotate by the orientation of the longest line
angle = median(thetaPeaks);
deskewed_Img = imrotate(Img, 90 + angle, 'bicubic', 'crop');
figure(3), clf;
imshow(deskewed_Img), title('Deskewed Image', "fontsize", FS);
saveas(3, 'Deskewed Paper using Hough Transform.png');
