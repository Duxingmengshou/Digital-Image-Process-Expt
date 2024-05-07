I = imread('circuit.tif');
rotI = imrotate(I,33,'crop');
subplot(2,2,1);
imshow(rotI);
title('原图')
BW = edge(rotI,'canny');
subplot(2,2,2);
imshow(BW);
title('边缘检测')
[H,theta,rho] = hough(BW);
subplot(2,2,3);
imshow(imadjust(rescale(H)),[],...
       'XData',theta,...
       'YData',rho,...
       'InitialMagnification','fit');
xlabel('\theta (degrees)')
ylabel('\rho')
axis on
axis normal 
hold on
title('峰值位置')
colormap(gca,hot)
P = houghpeaks(H,5,'threshold',ceil(0.3*max(H(:))));
x = theta(P(:,2));
y = rho(P(:,1));
plot(x,y,'s','color','black');
lines = houghlines(BW,theta,rho,P,'FillGap',5,'MinLength',7);
subplot(2,2,4); % 将原始图像和检测结果放在同一个子图中
imshow(rotI);
title('检测结果');
hold on;
for k = 1:length(lines)
    xy = [lines(k).point1; lines(k).point2];
    plot(xy(:,1), xy(:,2), 'LineWidth', 2, 'Color', 'green');
    plot(xy(1,1), xy(1,2), 'x', 'LineWidth', 2, 'Color', 'yellow');
    plot(xy(2,1), xy(2,2), 'x', 'LineWidth', 2, 'Color', 'red');
end