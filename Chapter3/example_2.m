% ʵ��� ����ͼ��ĸ���Ҷ�任

clear,clc;  % �������
filename = "E:\MyCode\Matlab\MATLABң������ͼ����_ʵ���̳�\Chapter3\haha.jpg";
I = imread(filename);  % ����RGBͼ��
I = rgb2gray(I);  % RGBת�Ҷ�ͼ��
j = fft2(I);  % ���и���Ҷ�任
k = fftshift(j);
L = log(1 + abs(k));  % �����任����ǿ�Ҷȼ���ϸ��
subplot(121), imshow(I);  % ԭʼͼ��
subplot(122), imshow(L, []);  % ��ʾ����Ҷ�任ͼ��