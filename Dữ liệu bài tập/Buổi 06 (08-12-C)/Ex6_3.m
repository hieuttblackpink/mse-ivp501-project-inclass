%Ex6_3 Noise low-pass filter (LPF)

clear, clc, close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
FS = 15;

%Construct 3 different filters
[wx, wy] = meshgrid(-pi : pi / 8 : pi, -pi : pi / 8 : pi);

%Compute frequency responses
##type = '1d_horizontal';
##type = '1d_vertical';
type = '2d';

if strcmp(type, '2d') == 1
  %Filter frequency-domain
  H = (1 / 256) * (1 + 2 * cos(wx) + 2 * cos(2 * wx)) .* (1 + 2 * cos(wy) + 2 * cos(2 * wy));
  h = (1 / 256) * ones(16); %Spatial domain
elseif strcmp(type, '1d_horizontal') == 1
  %Filter frequency-domain
  H = (1 / 16) * (1 + 2 * cos(wx) + 2 * cos(2 * wx));
  h = (1 / 16) * ones(1, 16); %Spatial domain
elseif strcmp(type, '1d_vertical') == 1
  %Filter frequency-domain
  H = (1 / 16) * (1 + 2 * cos(wy) + 2 * cos(2 * wy));
  h = (1 / 16) * ones(16, 1); %Spatial domain
end

%Plot 3 filter
figure(1), clf;
surf(wx / pi, wy / pi, abs(H)); axis([-1 1 -1 1 0 1]);
set(gca, 'XTick', -1 : 0.5 : 1, 'YTick', -1 : 0.5 : 1);
xlabel('\omega_x / \pi'); ylabel('\omega_y / \pi');
zlabel('H|(\omega_x, \omega_y)|');

%Apply to filter noisy image
I = imread('airplane.png');
Filter_I = imfilter(I, h, 'symmetric');

%Show image
figure(2), clf;
subplot(1, 2, 1), imshow(I), title('Original image', "fontsize", FS);
subplot(1, 2, 2), imshow(Filter_I), title('Filtered image', "fontsize", FS);

