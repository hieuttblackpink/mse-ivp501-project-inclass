%Ex4_2 Noise reduction using image averaging

clear, clc, close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
%Load image test
I = im2double(rgb2gray(imread('quadnight.jfif')));
##Load color image, then convert to gray-scale, and convert to double format

FS = 15; %Font-size of caption

%Repeat over different number of sample images
nI = [1 2 8 16 64 128];
for i = 1: numel(nI)
  N = nI(i); %Number of images to calculate the average
  avg_I = zeros(size(I)); %create an empty image

  for j = 1: N
    noisy_I = imnoise(I, 'gaussian', 0, 0.4);
    avg_I = avg_I + noisy_I;
  endfor

  %Calculate the average image and show it
  avg_I = avg_I / N;
  subplot(2, numel(nI) / 2, i);
  imshow(avg_I), title([num2str(N), 'image(s)'], "fontsize", FS);
end

