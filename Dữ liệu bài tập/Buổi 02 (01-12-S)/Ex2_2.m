%Ex2_2 Quantization

clear, clc, close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%pkg load image;
%load test image
Img = double(imread('tiger.jpg')); %Return double (0.00 -> 255.00)

%Display the original image with different number of bits
FS = 15;
for NumOfBit = 1 : 8
  %Quantize to a given number of bit(s)
  NumOfLevel = 2 .^ NumOfBit;
  LevelGap = 256 / NumOfLevel;
  quantized_Img = uint8(ceil(Img / LevelGap) * LevelGap - 1);

  %Plot image
  subplot(2, 4, NumOfBit);
  imshow(quantized_Img);

  %Image caption
  if (1 == NumOfBit)
    name = [num2str(NumOfBit) '-bit'];
  else
    name = [num2str(NumOfBit) '-bits'];
  end
  title(name, "fontsize", FS);

  %Save image
  imwrite(quantized_Img, ['Quantization_in_' name '.jpg']);
end
