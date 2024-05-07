% 读取lena图像并添加椒盐噪声
lena_gray = imread('lena_gray.bmp');
noisy_lena = imnoise(lena_gray, 'salt & pepper', 0.2);
% 不同的3x3均值滤波模板
% 定义模板1：均匀权重
mean_filter1 = ones(3, 3) / 9;
% 定义模板2：中心像素权重更高
mean_filter2 = [1, 1, 1; 1, 2, 1; 1, 1, 1] / 10;
% 定义模板3：对角线像素权重更高
mean_filter3 = [0, 1, 0; 1, 2, 1; 0, 1, 0] / 6;
% 应用不同的均值滤波模板
filtered_lena1 = conv2(double(noisy_lena), mean_filter1, 'same');
filtered_lena2 = conv2(double(noisy_lena), mean_filter2, 'same');
filtered_lena3 = conv2(double(noisy_lena), mean_filter3, 'same');
% 显示结果
figure;
subplot(2, 2, 1);
imshow(noisy_lena);
title('Noisy Lena');
subplot(2, 2, 2);
imshow(uint8(filtered_lena1));
title('Mean Filter (Uniform Weight)');
subplot(2, 2, 3);
imshow(uint8(filtered_lena2));
title('Mean Filter (Center Weighted)');
subplot(2, 2, 4);
imshow(uint8(filtered_lena3));
title('Mean Filter (Diagonal Weighted)');