##Ex2. Geometrics Operations, Histogram Equalization

clear, clc, close all;
pkg load image;
FS = 15;

################################################################################

##1. Read a given grayscale image. Contrast the original image:
Img = imread('Ex2.jfif');
##a. logarithm transformation with the constant c = 256/log(512);
x = uint8(0: 255);
c = 256 / log(256);
y = c * log(double(Img) + 1);
trans_Img = uint8(y);

figure(1), clf;
subplot(1, 2, 1), imshow(Img), title('Original image', "fontsize", FS);
subplot(1, 2, 2), imshow(trans_Img), title('Logarithmic transformation image', "fontsize", FS);

##b. piecewise linear transformation
LUT = uint8(zeros([1 256]));
LUT(1: 94) = 2 * (0: 93) + 10;
LUT(95: 169) = (94: 168) - 5;
LUT(170: 215) = (169: 214);
LUT(216: 256) = 255;
piecewise_Img = intlut(Img, LUT);

figure(2), clf;
subplot(1, 2, 1), imshow(Img), title('Original image', "fontsize", FS);
subplot(1, 2, 2), imshow(piecewise_Img), title('Piecewise linear transformation image', "fontsize", FS);

################################################################################

##2. Peform three different actions:
##a. flip left to right using fliplr
I_lr = fliplr(Img);

figure(3), clf;
subplot(1, 2, 1), imshow(Img), title('Original Image', "fontsize", FS);
subplot(1, 2, 2), imshow(I_lr), title('Flipping left-right Image', "fontsize", FS);

##b. rotate clockwise 180 degrees using imrotate
theta = 180;
I_r = imrotate(Img, theta);

figure(4), clf;
subplot(1, 2, 1), imshow(Img), title('Original Image', "fontsize", FS);
subplot(1, 2, 2), imshow(I_r), title('Rotate Image', "fontsize", FS);

##c. crop ½ central of the image using imcrop
[rows, cols] = size(Img);
crop_rect = [cols / 4, rows / 4, cols / 2, rows / 2];
I_c = imcrop(Img, crop_rect);

figure(5), clf;
subplot(1, 2, 1), imshow(Img), title('Original Image', "fontsize", FS);
subplot(1, 2, 2), imshow(I_c), title('Cropped Image', "fontsize", FS);

################################################################################
##3. Plot the histogram of the original image. Perform global histogram equalization.
figure(6), clf;
subplot(2, 2, 1), imshow(Img), title('Original image', "fontsize", FS);
[count, bins] = imhist(Img);
subplot(2, 2, 2), bar(bins, count);
set(gca, "fontsize", FS); grid on;
xlim = ([0 255]); ylim = ([0 max(count(:) + 500)]);
xlabel("Gray level"); ylabel("% of pixels");
title('Histogram before equalization', "fontsize", FS);

eq_I = histeq(Img);

subplot(2, 2, 3), imshow(eq_I), title('Equalized image', "fontsize", FS);
[count, bins] = imhist(eq_I);
bins *= 255;
subplot(2, 2, 4), bar(bins, count);
set(gca, "fontsize", FS); grid on;
xlim = ([0 255]); %ylim = ([0 max(count(:) + 500)]);
xlabel("Gray level"); ylabel("% of pixels");
title('Histogram after equalization', "fontsize", FS);

################################################################################
##4. Perform Contrast Local Adaptive Histogram Equalization (CLAHE) with the
## clipping ratio = 0.3

[count, bins] = imhist(Img);
maxCount = max(count(:));

clipRatio = [0.3];
limitedEq_I = cell(1, numel(clipRatio));
LUT = uint8(zeros(numel(clipRatio), 256));

for i = 1: numel(clipRatio)
  clip = clipRatio(i) * maxCount;
  clippedCount = (count < clip) .* count + (count >= clip) * clip;

  clipped_I = [];
  for level = 0: 255
    clipped_I = cat(2, clipped_I, level * ones(1, clippedCount(level + 1)));
  endfor
  [temp, T] = histeq_modified(uint8(clipped_I));

  LUT(i,:) = uint8(T * 255);
  limitedEq_I(i) = intlut(Img, LUT(i,:));
end

figure(7), clf;
subplot(1, 2, 1), imshow(Img), title('Original Image', "fontsize", FS);
subplot(1, 2, 2), imshow(limitedEq_I(1)), title('CLAHE Image (ClipLimit=0.3)', "fontsize", FS);
