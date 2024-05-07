% 读取灰度图像
lena_gray = imread('lena_gray.bmp');
lena_gray = double(lena_gray);  % 转换为双精度
% 获取图像尺寸
[M, N] = size(lena_gray);
% 对图像进行傅里叶变换
F = fftshift(fft2(lena_gray));
% 创建不同截止频率的理想低通滤波器
cutoff_frequencies = [5, 15, 30, 80, 230];  % 截止频率列表
results = cell(1, length(cutoff_frequencies));
for k = 1:length(cutoff_frequencies)
    % 创建理想低通滤波器
    D0 = cutoff_frequencies(k);  % 当前截止频率
    [u, v] = meshgrid(-N/2:N/2-1, -M/2:M/2-1);
    D = sqrt(u.^2 + v.^2);
    H = double(D <= D0);  % 创建掩码
    % 进行频域滤波
    G = F .* H;
    % 计算逆傅里叶变换
    filtered_lena = ifft2(ifftshift(G));
    results{k} = abs(filtered_lena);  % 存储结果
end
% 显示结果
figure;
subplot(2, 3, 1);
imshow(uint8(lena_gray));
title('Original Lena');
for k = 1:length(cutoff_frequencies)
    subplot(2, 3, k + 1);
    imshow(uint8(results{k}));
    title(['Cutoff Frequency: ', num2str(cutoff_frequencies(k))]);
end