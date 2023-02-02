% ʵ���� ͼ����ǿ

%% ����ֱ��ͼ��ͼ����ǿ
% clear,clc;  % �������
% filename = "E:\MyCode\Matlab\MATLABң������ͼ����_ʵ���̳�\Chapter3\hzwz.jpeg";  % ͼƬ����·��
% I = imread(filename);  % ��ȡͼƬ
% imshow(I);  % ��ʾͼƬ

%% ͼ��ռ���ƽ��
% ����ͼ�񲢼�������
clear,clc;  % �������
filename = "E:\MyCode\Matlab\MATLABң������ͼ����_ʵ���̳�\Chapter3\hzwz.jpeg";  % ͼƬ����·��
I = imread(filename);  % ��ȡͼƬ
I = rgb2gray(I);
J = imnoise(I,'salt & pepper', 0.05);  % ��ͼ��I�м���0.05�Ľ�������
K = imnoise(I, 'gaussian', 0.01, 0.02);  % ��ͼ����ͼ���м����ֵΪ0.01������Ϊ0.02�ĸ�˹������
% subplot(1,3,1), imshow(I); title('ԭͼ');
% subplot(1,3,2), imshow(J); title('��������ͼ');
% subplot(1,3,3), imshow(K); title('��˹����ͼ');

% ���������ڲ�Ͷ����ֵ�µ��˲���ֵ
h1 = ones(3,3)/9;  % 3��3����
J1 = imfilter(J, h1);
h2 = ones(7,7)/9;  % 7��7����
J2 = imfilter(J, h2);
% subplot(1,3,1), imshow(J); title('��������ͼ');
% subplot(1,3,2), imshow(J1); title('3��3���ھ�ֵ�˲�');
% subplot(1,3,3), imshow(J2); title('7��7���ھ�ֵ�˲�');

% �Ը�˹�������о�ֵ����ֵ�˲�
h = ones(5,5)/25;  % 3��3����
K1 = imfilter(K, h);  % ��ֵ�˲�
K2 = medfilt2(K);  % ��ֵ�˲�
subplot(1,3,1), imshow(J); title('��˹����ͼ');
subplot(1,3,2), imshow(J1); title('5��5���ھ�ֵ�˲�ͼ');
subplot(1,3,3), imshow(J2); title('��ֵ�˲�ͼ');


%% ͼ��ռ�����
% ����������ͼ��
clear,clc;  % �������
filename = "E:\MyCode\Matlab\MATLABң������ͼ����_ʵ���̳�\Chapter3\hzwz.jpeg";  % ͼƬ����·��
I = imread(filename);  % ��ȡͼƬ
% I = rgb2gray(I);  % RGBת�Ҷ�ͼ��
hx = [-1 -2 -1; 0 0 0; 1 2 1];  %����Sobel��ֱ�ݶ�ģ��
hy = hx';
gradx = imfilter(I,hx);  % ����ͼ���Sobel��ֱ�ݶ�
grady = imfilter(I,hy);  % ����ͼ���Sobelˮƽ�ݶ�
grad = gradx.^2 + grady.^2;  % �õ�ͼ���Sobel�ݶ�
subplot(221), imshow(I); title('ԭʼͼ');
subplot(222), imshow(gradx); title('ͼ���sobel��ֱ�ݶ�');
subplot(223), imshow(grady); title('ͼ���sobelˮƽ�ݶ�');
subplot(224), imshow(grad); title('ͼ���sobel�ݶ�');

% ����fspecial�������ɸ����ݶ�����
h = fspecial(''sobel)


%% ͼ��Ƶ����ƽ������

