% ʵ���� ͼ�����ѹ��

%% MATLAB����غ��� �Ҷ�ͼ��
% dct2 ��ά��ɢ����
% idct2 ��ά��ɢ���ҷ��任
% dctmtx ����DCT�任����
% blkproc ��ͼ����зֿ鴦��

%% ��1
clc;clear all; close all;
filename = "E:\MyCode\Matlab\MATLABң������ͼ����_ʵ���̳�\Chapter3\hzwz.jpeg";  % ͼƬ����·��
I = imread(filename);  % ��ȡͼƬ
I = rgb2gray(I);
I1 = im2double(I);
T = dct2(I1);
T1 = T;
T1(1,1) = 0;  % ȥ��ԭ��ֵ
I2 = idct2(T1);  % �Ը�ͼ�������ɢ���ҷ��任
% ��ʾ
subplot(121), imshow(I);
subplot(122), imshow(I2);


%% ��2
clc;clear all; close all;
filename = "E:\MyCode\Matlab\MATLABң������ͼ����_ʵ���̳�\Chapter3\hzwz.jpeg";  % ͼƬ����·��
I = imread(filename);  % ��ȡͼƬ
I = rgb2gray(I);
I = im2double(I);
T = dctmtx(8);  % ��ɢ���ұ任����
B = blkproc(I, [8 8], 'P1 * x * P2', T, T');  % ��Դͼ�����DCT�任
mask = [1 1 1 0 0 0 0 0
        1 1 1 0 0 0 0 0
        1 1 1 0 0 0 0 0
        0 0 0 0 0 0 0 0
        0 0 0 0 0 0 0 0
        0 0 0 0 0 0 0 0
        0 0 0 0 0 0 0 0
        0 0 0 0 0 0 0 0];
 B2 = blkproc(B, [8 8], 'P1.*x', mask);  % ����ѹ�����������½Ǹ�Ƶ����
 I2 = blkproc(I, [8 8], 'P1 * x * P2', T', T);  % ���з�DCT�任
 
 figure;  % �¿�һ��ͼ�δ���
 subplot(121); imshow(I, []);
 subplot(122); imshow(I2, []);


