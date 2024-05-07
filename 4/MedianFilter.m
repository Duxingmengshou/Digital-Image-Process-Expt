% 1.a) 对imagegray.jpg图像添加椒盐噪声，并利用不同的3*3均值滤波模板进行均值滤波
image = imread('lena_gray.bmp');
% 添加椒盐噪声
noisy_image = imnoise(image, 'salt & pepper', 0.2);
% 1.b) 利用中值滤波对加了椒盐噪声后的图片进行均值滤波
median_filtered_image = medfilt2(noisy_image, [3 3]);
% 显示结果
figure;
subplot(1, 3, 1);
imshow(uint8(image));
title('Image');
subplot(1, 3, 2);
imshow(uint8(noisy_image));
title('Noisy image');
subplot(1, 3, 3);
imshow(uint8(median_filtered_image));
title('Median Filtered (3x3)');