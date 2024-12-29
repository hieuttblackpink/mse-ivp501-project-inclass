%Ex10_2 Hough Transform
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%load test image
%Img = imread('dots.png');
%Img = imread('dashline.png');
Img = imread('line.png');

%show images
FS = 15; %fontsize of caption
figure, clf;
imshow(Img), title('Original Image', "fontsize", FS);

pkg load image;
[H, theta, rho] = hough(Img, 'Theta', -90 : 1 : 90, 'RhoResolution', 1);
%show Hough transform in 2-D plane
h1 = figure; imagesc(theta, rho, H);
axis on, axis normal, hold on;
colormap(hot), colorbar;
xlabel('\theta', "fontsize", FS); ylabel('\rho', "fontsize", FS);
set(gca, "fontsize", FS);
print(h1, 'Hough Transform in 2D.png');

%show Hough transform in 3-D plane
h2 = figure; mesh(H, 'XData', theta, 'YData', rho);
axis tight, hold on;
colormap(hot), colorbar;
xlabel('\theta', "fontsize", FS); ylabel('\rho', "fontsize", FS);
set(gca, 'YDir', 'reverse', "fontsize", FS);
print(h2, 'Hough Transform in 3D.png');
