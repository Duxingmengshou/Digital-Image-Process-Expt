% 读取图像
img = imread('rice.png');
% 显示原始图像
figure;
subplot(2,2,1);
imshow(img);
title('Original Image');
% (1) 使用imhist显示灰度直方图
[counts, bins] = imhist(img);
subplot(2,2,2);
stem(bins, counts, 'Marker', 'none');
title('Histogram of the Image');
xlabel('Pixel Intensity');
ylabel('Frequency');
% 找到波峰和波谷
[peaks, locs] = findpeaks(counts);
[valleys, locs_valleys] = findpeaks(1500-counts);
loci=1;
for i = 1:length(peaks)
    if peaks(loci)<peaks(i)
        loci=i;
    end
end
locres=locs(loci);
disp(locres);
loci=1;
for i = 1:length(valleys)
    if valleys(loci)<valleys(i)&&valleys(i)<1400
        loci=i;
    end
end
locres_v=locs_valleys(loci);
disp(locres_v);
% 选择波峰和波谷之间的最小值作为阈值
threshold = (locres+locres_v)/2.;
% 使用阈值进行图像分割
seg_img = img > threshold;
% 显示分割结果
subplot(2,2,3);
imshow(seg_img);
title('Segmented Image using Peak and Valley');
% (2) 使用OTSU方法进行分割
otsu_threshold = graythresh(img);
otsu_seg_img = imbinarize(img, otsu_threshold);
% 显示OTSU分割结果
subplot(2,2,4);
imshow(otsu_seg_img);
title('Segmented Image using Otsu Method');