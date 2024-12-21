%Ex8_5 Edge detection: Sobel operator

clear, clc, close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
FS = 15;

%Load image test
O_I = imread('man_face.png');
I = double(O_I);

h = fspecial('sobel');
%Apply Sobel filter in horizontal direction
filtered_I1 = imfilter(I, h, 'symmetric');
filtered_I1 = abs(filtered_I1); %get its magnitude
filtered_I1 = filtered_I1 / max(filtered_I1(:));

%Apply Sobel filter in vertical direction
filtered_I2 = imfilter(I, h', 'symmetric');
filtered_I2 = abs(filtered_I2); %get its magnitude
filtered_I2 = filtered_I2 / max(filtered_I2(:));

%Apply Sobel filter in both direction
edge_sum = filtered_I1 .^ 2 + filtered_I2 .^ 2;
edge_sum = log(edge_sum + 1); %gets it magnitude in log
log_edge_sum = edge_sum / max(edge_sum(:)); %nomalize it

bw_edge1 = log_edge_sum > 0.01; %threshold = 1%
bw_edge2 = log_edge_sum > 0.05; %threshold = 5%
bw_edge3 = log_edge_sum > 0.1; %threshold = 10%

%Show image
figure(1), clf;
subplot(2, 3, 1), imshow(O_I), title('Original image', "fontsize", FS);
subplot(2, 3, 2), imshow(filtered_I1), title('Sobel horizontal image', "fontsize", FS);
subplot(2, 3, 3), imshow(filtered_I2), title('Sobel vertical image', "fontsize", FS);
subplot(2, 3, 4), imshow(bw_edge1), title('Mag > 0.01 image', "fontsize", FS);
subplot(2, 3, 5), imshow(bw_edge2), title('Mag > 0.05 image', "fontsize", FS);
subplot(2, 3, 6), imshow(bw_edge3), title('Mag > 0.1 image', "fontsize", FS);