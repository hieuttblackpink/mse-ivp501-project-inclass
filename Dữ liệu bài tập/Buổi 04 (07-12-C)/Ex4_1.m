%Ex4_1 Gray-Level transformations

clear, clc, close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
%Load image test
I = imread('lion.jpg');

FS = 15; %Font-size of caption
####################################################
%a. Indetity transformations
%plot the transformation function
##figure(1), clf;
##x = uint8(0: 255);
##plot(x, 'LineWidth', 1.5);
##xlim([0 255]);
##ylim([0 255]);
##grid on;
##
##%perform the identity transformation
##I1 = x(I + 1);
##figure(2), clf;
##subplot(1, 2, 1), imshow(I), title('Original image', "fontsize", FS);
##subplot(1, 2, 2), imshow(I1), title('Indentity', "fontsize", FS);

%saveas(2, 'Indentity transformation.png');

####################################################
%b. Negative transformations
%plot the transformation function
##figure(1), clf;
##x = uint8(255: -1: 0);
##plot(y, 'LineWidth', 1.5);
##xlim([0 255]);
##ylim([0 255]);
##grid on;
##
##%perform the identity transformation
##I2 = x(I + 1);
##figure(2), clf;
##subplot(1, 2, 1), imshow(I), title('Original image', "fontsize", FS);
##subplot(1, 2, 2), imshow(I2), title('Negative', "fontsize", FS);

######################################################
##%c. Logarithmic transformations
##%plot the transformation function
##figure(1), clf;
##x = uint8(0: 255);
##c = 255 / log(256);
##y = c * log(x + 1);
##plot(y, 'LineWidth', 1.5);
##xlim([0 255]);
##ylim([0 255]);
##grid on;
##
##%perform the identity transformation
##I3 = uint8(y(I + 1));
##figure(2), clf;
##subplot(1, 2, 1), imshow(I), title('Original image', "fontsize", FS);
##subplot(1, 2, 2), imshow(I3), title('Logarithmic', "fontsize", FS);

####################################################
%d. Piecewise linear transformations
%plot the transformation function
figure(1), clf;
LUT = uint8(zeros([1 256]));
LUT(1: 101) = (0: 100) + 10;
LUT(102: 201) = 150;
LUT(202: 256) = 0.85 * (201: 255);
plot(LUT, 'LineWidth', 1.5);
xlim([0 255]);
ylim([0 255]);
grid on; axis tight, axis square;

%perform the identity transformation
I4 = intlut(I, LUT);
figure(2), clf;
subplot(1, 2, 1), imshow(I), title('Original image', "fontsize", FS);
subplot(1, 2, 2), imshow(I4), title('Piecewise linear', "fontsize", FS);
