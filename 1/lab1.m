% 读取灰度图像
grayLena = imread('lena_gray.bmp');
% 读取彩色图像
colorLena = imread('lena_color.tiff');
% 显示灰度图像为二值图像
binaryLena = imbinarize(grayLena);
% 显示灰度图像为8级灰度图像
gray8Lena = uint8(grayLena);
% 显示灰度图像的指定灰度区间
grayRangeLena = grayLena >= 150 & grayLena <= 220;
% 显示二值图像，黑色用蓝色表示，白色用绿色表示
% 创建一个三通道的图像，全为0，用于显示蓝色和绿色
colorBinaryLena = zeros([size(binaryLena), 3]);
% 设置黑色用蓝色表示，白色用绿色表示
colorBinaryLena(:,:,3) = binaryLena; % 蓝色通道，黑色部分
colorBinaryLena(:,:,2) = ~binaryLena; % 绿色通道，白色部分
% 显示灰度图像和彩色图像
figure;
subplot(2, 3, 1), imshow(grayLena), title('Gray Lena');
subplot(2, 3, 2), imshow(binaryLena), title('Binary Lena');
subplot(2, 3, 3), imshow(gray8Lena), title('8-bit Gray Lena');
subplot(2, 3, 4), imshow(grayRangeLena), title('Gray Range[150,220] Lena');
subplot(2, 3, 5), imshow(colorBinaryLena), title('Binary Color Lena');
subplot(2, 3, 6), imshow(colorLena), title('Color Lena');
% 保存变换后的图像为bmp格式和png格式
imwrite(binaryLena, 'binary_lena.bmp');
imwrite(binaryLena, 'binary_lena.png');