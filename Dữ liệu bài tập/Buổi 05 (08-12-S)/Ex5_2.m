%Ex5_2 Contrast Limited Adaptive Histogram Equalization (CLAHE)

clear, clc, close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
%Load image test
I = imread('moon.jpg');

FS = 15; %Font-size of caption

%Perform image histogram and find the max count
[count, bins] = imhist(I);
maxCount = max(count(:));

%Loop over different ratios
clipRatio = [1 0.7 0.4 0.1]; %ratio = 1: no clipping, ratio = 0.7: clipping from 70%
limitedEq_I = cell(1, numel(clipRatio));
LUT = uint8(zeros(numel(clipRatio), 256));

for i = 1: numel(clipRatio)
  %clip histogram
  clip = clipRatio(i) * maxCount;
  clippedCount = (count < clip) .* count + (count >= clip) * clip;

  %construct 1D vitural for hiseq to get mapping fuction
  clipped_I = [];
  for level = 0: 255
    clipped_I = cat(2, clipped_I, level * ones(1, clippedCount(level + 1)));
  endfor
  [temp, T] = histeq_modified(uint8(clipped_I));

  %apply mapping function
  LUT(i,:) = uint8(T * 255);
  limitedEq_I(i) = intlut(I, LUT(i,:));
end

%show images
figure(1), clf;
for i = 1: numel(clipRatio)
  subplot(1, numel(clipRatio), i), imshow(limitedEq_I(i));
  title(['Clip at ' num2str(clipRatio(i)) ' max'], "fontsize", FS);
end

figure(2), clf;
set(gcf, 'Position', [100 100 600 300]);
subplot(1, 2, 1), bar(bins, count), axis([0 255 0 max(count(:)) + 500]);
set(gcf, "fontsize", FS);
subplot(1, 2, 2), plot(LUT(1:4, :)', "LineWidth", 1.5); axis([0 255 0 255]);
set(gcf, "fontsize", FS); set(gcf, "Color", white');
