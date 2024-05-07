% 1. 图像的色彩空间转换
lena = imread('lena_color.tiff');
hsvLena = rgb2hsv(lena);
hChannel = hsvLena(:,:,1); % 提取H通道
sChannel = hsvLena(:,:,2); % 提取S通道
vChannel = hsvLena(:,:,3); % 提取V通道

figure;
subplot(2, 2, 1), imshow(lena), title('Original Image');
subplot(2, 2, 2), imshow(hChannel), title('Hue Channel');
subplot(2, 2, 3), imshow(sChannel), title('Saturation Channel');
subplot(2, 2, 4), imshow(vChannel), title('Value Channel');

% 2. 图像的加运算和与运算
% a) 缩放图像
house = imread('house.tiff');
resizedHouse = imresize(house, [size(lena, 1), size(lena, 2)]); % 缩放leaf到与lena相同大小

% b) 相加运算
A = double(lena);
B = double(resizedHouse);
sumImage = uint8((A/2) + (B/2)); % 相加并转换回uint8类型

figure;
subplot(1, 3, 1), imshow(lena), title('Original Lena');
subplot(1, 3, 2), imshow(house), title('Original House');
subplot(1, 3, 3), imshow(sumImage), title('Sum of Lena and House');

% c) 与运算
BWmask = imread('BWmask.jpg');
BWmask_resized = imresize(BWmask, [size(lena, 1), size(lena, 2)]); % 调整大小
BWmask_gray = im2gray(BWmask_resized); % 将调整大小后的图像转换为灰度图像
BWmask_binary = imbinarize(BWmask_gray); % 将灰度图像二值化

extractedRegion = lena .* uint8(BWmask_binary); % 与运算

figure;
subplot(1, 3, 1), imshow(lena), title('Original Lena');
subplot(1, 3, 2), imshow(BWmask_binary), title('Original BWmaks');
subplot(1, 3, 3), imshow(extractedRegion), title('Extracted Region');

% 3. 图像的旋转
rotated45 = imrotate(lena, 45);
rotated90 = imrotate(lena, 90);
rotated180 = imrotate(lena, 180);

figure;
subplot(2, 2, 1), imshow(lena), title('Original Lena');
subplot(2, 2, 2), imshow(rotated45), title('Rotated 45 Degrees');
subplot(2, 2, 3), imshow(rotated90), title('Rotated 90 Degrees');
subplot(2, 2, 4), imshow(rotated180), title('Rotated 180 Degrees');