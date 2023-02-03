% ʵ���� ͼ��ָ�

% ͼ��ָ�����ͼ����õ�ͼ������Ĺؼ����裬��ͼ��ʶ��ͼ�����Ӿ�������Ҫ��Ԥ����ͼ��ָ����ȡ��Ŀ�������ͼ��ʶ��
% ������ȡ��ͼ������������ͼ��ָ�Ļ���������Ҫ�ǻ���ͼ��Ҷ�ֵ���������ԣ����ҶȲ������ͻҶ������ԣ����ͼ��ָ���Ի���
% ��Ե�ķָ���ͻ�������ķָ��������ʵ��ͨ����ɼ򵥵�ͼ��ָ��һ�������ͼ��ָ����⡣

%% ��غ���
% edge:��Ե��⺯��
% graythresh: ����Otsu�㷨(�����䷽��)��ȡȫ����ֵ
% im2bw: ���Ҷ�ͼ��ת��Ϊ��ֵͼ��
% bwtraceboundary: �ڶ�ֵͼ����׷��Ŀ��������
% hough: Hough �任����
% houghpeaks: hough�任��ֵʶ��
% houghline: ����hough�任��ȡ��Ԫ

%% ��ͼ����ֵ�ָ�
% ����ֱ��ͼ
clc;clear all; close all;
filename = "E:\MyCode\Matlab\MATLABң������ͼ����_ʵ���̳�\Chapter3\hzwz.jpeg";  % ͼƬ����·��
I = imread(filename);  % ��ȡͼƬ
I = rgb2gray(I);  % RGBת�Ҷ�ͼ��
subplot(221); imshow(I); title('�Ҷ�ͼ��');
subplot(222); imhist(I); title('�Ҷ�ֱ��ͼ'), xlabel('�Ҷ�ֵ'), ylabel('��Ԫ����')
I2 = im2bw(I, 110/255);
subplot(223), imshow(I2); title('��ֵΪ100��ͼ��ָ���');
I3 = im2bw(I, 150/255);
subplot(224), imshow(I3); title('��ֵΪ150��ͼ��ָ���');

% ���������䷽���Otsu���Զ�ȷ����ֵ���зָ�
clc;clear all; close all;
filename = "E:\MyCode\Matlab\MATLABң������ͼ����_ʵ���̳�\Chapter3\hzwz.jpeg";  % ͼƬ����·��
I = imread(filename);  % ��ȡͼƬ
I = rgb2gray(I);  % RGBת�Ҷ�ͼ��
subplot(121); imshow(I); title('ԭʼͼ��');
level = graythresh(I);  % ȷ���Ҷ���ֵ
BW = im2bw(I, level);
subplot(122); imshow(BW); title('Otsu��ͼ��ָ���');

%% ���ڱ�Ե��ͼ��ָ�

% ���ø��ֱ�Ե������Ӽ���Ե
clc;clear all; close all;
filename = "E:\MyCode\Matlab\MATLABң������ͼ����_ʵ���̳�\Chapter3\haha.jpg";  % ͼƬ����·��
I = imread(filename);  % ��ȡͼƬ
I = rgb2gray(I);  % RGBת�Ҷ�ͼ��
subplot(241); imshow(I); title('ԭʼͼ��');
I1 = im2bw(I);  
subplot(242); imshow(I1); title('��ֵͼ��');
I2 = edge(I1, 'roberts');
subplot(243); imshow(I2); title('roberts���Ӽ����');
I3 = edge(I1, 'prewitt');
subplot(244); imshow(I3); title('prewitt���Ӽ����');
I4 = edge(I1, 'sobel');
subplot(245); imshow(I4); title('sobel���Ӽ����');
I5 = edge(I1, 'canny');
subplot(246); imshow(I5); title('canny���Ӽ����');
I6 = edge(I1, 'log');
subplot(247); imshow(I6); title('log���Ӽ����');

% �߽����bwtraceboundary����
% ��Prewitt���Ӽ����Ϊ�������Ʊ߽�
BW = I3;
s = size(BW);
col = round(s(2)/2 - 90);  % ������ʼ��������
row = find(BW(:,col),1);  % Ѱ����ʼ��������
connectivity = 8; % ���ð�����Ѱ�ң�ȱʡֵ
num_points = 18000000;
%��ȡ�߽�
contour = bwtraceboundary(BW, [row,col], 'N', connectivity, num_points);
imshow(I); hold on;
% ��ԭͼ�л���ȡ����
plot(contour(:,2), contour(:,1), 'g', 'LineWidth',6);
title('�߽����ͼ��')


%% Hough�任����߶�
clc;clear all; close all;
filename = "E:\MyCode\Matlab\MATLABң������ͼ����_ʵ���̳�\Chapter3\hzwz.jpeg";  % ͼƬ����·��
I1 = imread(filename);  % ��ȡͼƬ
I1 = rgb2gray(I1);  % ת�Ҷ�
I = imrotate(I1,33,'crop');
BW = edge(I, 'canny');
subplot(231),imshow(I1),title('ԭʼͼ��');
subplot(232),imshow(I),title('��ת���ͼ��');
subplot(233),imshow(BW),title('��Ե���ͼ��');
[H,theta,rho] = hough(BW);  % Hough�任
subplot(234), hold on, imshow(imadjust(mat2gray(H)), [], 'XData', theta, 'YData',rho, 'Initialmagnification', 'fit');
title('��ֵ���');
xlabel('\theta(degrees)'), ylabel('\rho');
axis on, axis normal, hold on
P = houghpeaks(H,10,'threshold', ceil(0.3*max(H(:))));
x = theta(P(:,2));
y = rho(P(:,1));
plot(x, y, 's', 'color', 'red');
lines = houghlines(BW,theta,rho,P,'FillGap',5,'Minlength',7);
subplot(235), imshow(I);title('��⵽���߶�'); hold on  % ��ͼ
max_len = 0;
for k = 1:length(lines)
    xy = [lines(k).point1;lines(k).point2];
    plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
    % �����߶����յ�
    plot(xy(1,1),xy(1,2),'LineWidth',2,'Color','green');  
    plot(xy(2,1),xy(2,2),'LineWidth',2,'Color','green');
    % ȷ����߶εĶ˵�
    len = norm(lines(k).point1 - lines(k).point2);
    if (len > max_len)
        max_len = len;
        xy_long = xy;
    end
end
% ͻ����ʾ�һ���߶�
plot(xy_long(:,1), xy_long(:,2), 'LineWidth',2 ,'Color','red');

% ���޸Ĳ�����һ����⣡����



