% 1.a) 直接对像素乘以一个实数的倍数n来对图像的亮度进行一个整体的提升
image = imread('castle.gif');

% 对图像的亮度进行线性增强
figure;
n_values = [2, 4, 5];
j=1;
subplot(2,2,j);
imshow(image);
title('Original Image');
j=j+1;
for i = 1:numel(n_values)
    enhanced_image = image * n_values(i);
    enhanced_image(enhanced_image > 255) = 255; % 超出255的部分设为255
    subplot(2,2,j);
    imshow(uint8(enhanced_image));
    title(['Enhanced castle (n = ' num2str(n_values(i)) ')']);
    j=j+1;
end

% 1.b) 对灰度图进行一个反转显示
reversed_image = 255 - image;
figure;
subplot(1,2,1);
imshow(image);
title('Original Image');
subplot(1,2,2);
imshow(reversed_image);
title('Reversed image');

% 1.c) 对一个灰度图像进行线性变换
% 显示原始图像的直方图
figure;
subplot(2,2,1);
imshow(image);
title('Original Image');
subplot(2,2,3);
imhist(image);
title('Original Histogram');
% 利用imadjust对图像0%到30%灰度值区间内的像素值映射到0~100%之间
adjusted_image = imadjust(image, [0 0.3], [0 1]);
% 显示调整后的图像和直方图
subplot(2,2,2);
imshow(adjusted_image);
title('Adjusted Image');
subplot(2,2,4);
imhist(adjusted_image);
title('Adjusted Histogram');

% 2.a) 利用histeq函数对图像imagegray.jpg和tower.png进行直方图均衡化处理
% 对图像进行直方图均衡化处理
eq_image_gray = histeq(image);
figure;
subplot(2,2,1);
imshow(image);
title('Original Image');
subplot(2,2,3);
imhist(image)
title('Original Histogram');
subplot(2,2,2);
imshow(eq_image_gray);
title('Adjusted Image');
subplot(2,2,4);
imhist(eq_image_gray)
title('Adjusted Histogram');
