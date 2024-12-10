%Ex5_5 Subsampling

clear, clc, close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
%Load image test
I = im2double(imread('bike.png'));

FS = 15; %Font-size of caption

[row, column] = size(I);

%Perform subsampling by a matrix multiplication
a = eye(row / 2);
b = [1; 0];
c = [0.5; 0.5];

h1 = kron(a, b);
h2 = kron(a, c);

sub_I1 = h1' * I * h1; %h1': the transpose matrix of h1
sub_I2 = h2' * I * h2;

%show images
figure(1), clf;
subplot(1, 3, 1), imshow(I), title('Original image', "fontsize", FS);
subplot(1, 3, 2), imshow(sub_I1), title('Method 1', "fontsize", FS);
subplot(1, 3, 3), imshow(sub_I2), title('Method 2', "fontsize", FS);
