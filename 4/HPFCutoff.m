% 读取灰度图像
lena_gray = imread('lena_gray.bmp');
lena_gray = double(lena_gray);  % 转换为双精度
% 获取图像尺寸
[M, N] = size(lena_gray);
% 对图像进行傅里叶变换
F = fftshift(fft2(lena_gray));
% 创建不同截止频率的高通滤波器
cutoff_frequencies = [15, 30, 80];  % 截止频率列表
results = cell(3, length(cutoff_frequencies));
% 遍历每种高通滤波器
for i = 1:3
    filter_type = i;  % 高通滤波器类型：1-理想，2-巴特沃斯，3-高斯
    for k = 1:length(cutoff_frequencies)
        % 创建高通滤波器
        D0 = cutoff_frequencies(k);  % 当前截止频率
        [u, v] = meshgrid(-N/2:N/2-1, -M/2:M/2-1);
        D = sqrt(u.^2 + v.^2);
        switch filter_type
            case 1
                H = double(D > D0);  % 理想高通滤波器
            case 2
                n = 2;  % 巴特沃斯滤波器阶数
                H = 1 ./ (1 + (D ./ D0).^(2 * n));  % 巴特沃斯高通滤波器
            case 3
                H = 1 - exp(-(D.^2) / (2 * (D0.^2)));  % 高斯高通滤波器
        end
        % 进行频域滤波
        G = F .* H;
        % 计算逆傅里叶变换
        filtered_lena = ifft2(ifftshift(G));
        results{i, k} = abs(filtered_lena);  % 存储结果
    end
end

% 显示结果
figure;
filter_names = {'Ideal', 'Butterworth', 'Gaussian'};
for i = 1:3
    for k = 1:length(cutoff_frequencies)
        subplot(3, 3, (i-1) * 3 + k);
        imshow(uint8(results{i, k}));
        title([filter_names{i}, ' HPF - Cutoff: ', num2str(cutoff_frequencies(k))]);
    end
end