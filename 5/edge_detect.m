% 读取图像
gray_img = imread('circles.png');
% gray_img = rgb2gray(img); % 转为灰度图像
figure;
subplot(3, 3, 1);
imshow(gray_img);
title('circles');

% (1) Roberts算子
roberts_h = [1 0; 0 -1];
roberts_v = [0 1; -1 0];
edge_roberts_h = conv2(double(gray_img), roberts_h, 'same');
edge_roberts_v = conv2(double(gray_img), roberts_v, 'same');

subplot(3, 3, 2);
imshow(abs(edge_roberts_h), []);
title('Roberts Horizontal');
subplot(3, 3, 3);
imshow(abs(edge_roberts_v), []);
title('Roberts Vertical');

% (2) Sobel算子
edge_sobel_h = edge(gray_img, 'Sobel', 'horizontal');
edge_sobel_v = edge(gray_img, 'Sobel', 'vertical');

subplot(3, 3, 4);
imshow(edge_sobel_h);
title('Sobel Horizontal');
subplot(3,3, 5);
imshow(edge_sobel_v);
title('Sobel Vertical');

% (3) Prewitt算子
edge_prewitt_h = edge(gray_img, 'Prewitt', 'horizontal');
edge_prewitt_v = edge(gray_img, 'Prewitt', 'vertical');

subplot(3, 3, 6);
imshow(edge_prewitt_h);
title('Prewitt Horizontal');
subplot(3, 3, 7);
imshow(edge_prewitt_v);
title('Prewitt Vertical');

% (4) Laplacian算子
laplacian = [0 -1 0; -1 4 -1; 0 -1 0];
edge_laplacian = conv2(double(gray_img), laplacian, 'same');

subplot(3,3,8);
imshow(abs(edge_laplacian), []);
title('Laplacian');

% (5) Canny算子
edge_canny = edge(gray_img, 'Canny');

subplot(3,3,9);
imshow(edge_canny);
title('Canny');