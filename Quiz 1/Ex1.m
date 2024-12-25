##Ex1. Image Sensing and Acquisition

clear, clc, close all;
pkg load image;
FS = 15;

################################################################################

##Read a given color image (‘Ex1.jpg’). Display the original image and its tricolor
##elements: Red (R), Green (G) and Blue (B) separately.
Img = imread('Ex1.jpg');
R = Img(:, :, 1);
G = Img(:, :, 2);
B = Img(:, :, 3);

figure(1), clf;
subplot(2, 2, 1), imshow(Img), title('Original Image', "fontsize", FS);
subplot(2, 2, 2), imshow(R), title('Red elements Image', "fontsize", FS);
subplot(2, 2, 3), imshow(G), title('Green elements Image', "fontsize", FS);
subplot(2, 2, 4), imshow(B), title('Blue elements Image', "fontsize", FS);

##2. Reorder the three components to create a new image as (BRG)
BRG = cat(3, B, R, G);

figure(2), clf;
subplot(1, 1, 1), imshow(BRG), title('Reorder Image (BRG)', "fontsize", FS);

##3. Make the original image increase the contrast by a gamma correction scale 1.2,
## then darker 80% using a scale value.
gamma = 1.2;
enhance_Img = uint8(255 * ((double(Img) / 255) .^ gamma));
scale = 0.8;
scaled_Img = uint8(double(Img) * scale);

figure(3), clf;
subplot(1, 2, 1), imshow(enhance_Img), title('Contrast Image', "fontsize", FS);
subplot(1, 2, 2), imshow(scaled_Img), title('Scale Image', "fontsize", FS);

##4. Quantize and display the grayscale image using 2 bits, 4 bits, 6 bits and 8 bits.
## Visualize the effect of the operations.
gray_Img = rgb2gray(Img);

quant_levels = [2, 4, 6, 8];
figure;
for i = 1 : length(quant_levels)
  NumOfBit = quant_levels(i);
  NumOfLevel = 2 .^ NumOfBit;
  LevelGap = 256 / NumOfLevel;
  quantized_Img = uint8(floor(double(gray_Img) / LevelGap) * LevelGap);

  subplot(2, 2, i);
  imshow(quantized_Img);
  name = [num2str(NumOfBit) '-bits'];
  title(name, "fontsize", FS);
end
