% ʵ��һ MATLABͼ�������

%% �ļ�����

% 1)���������ļ�test.dat,���ڴ�ž���A������
A = [1 2 3; 4 5 6; 7 8 9];
fid = fopen('test.dat','w');
cnt = fwrite(fid, A, 'float');
fclose(fid)

% 2����ȡ�ļ�test.dat������
fid = fopen('test.dat','r');
[B, cnt] = fread(fid,[5, inf],'float');  % ��ȡ��ʽΪ5��
fclose(fid);

% 3���ļ���λ
% д
a = 1:5;
fid = fopen('fdat.txt','w');
fwrite(fid, a,'int16');
status1 = fclose(fid);
% ��
fid = fopen('fdat.txt','r');
status2 = fseek(fid,6,'bof');  % ���ļ�ָ��ӿ�ʼλ����β��ƫ��6���ֽ�
four = fread(fid,1,'int16');
position = ftell(fid);
eight = fread(fid,1,'int16');


%% ͼ���������
% 1�����벢��ʾһ��ͼ��
clear;
close all;
filename = "E:\MyCode\Matlab\MATLABң������ͼ����_ʵ���̳�\Chapter3\haha.jpg"
I = imread(filename);
imshow(I)

% 2����ͼ�����һЩ��������
clear; close all;
filename = "E:\MyCode\Matlab\MATLABң������ͼ����_ʵ���̳�\Chapter3\haha.jpg";
I = imread(filename);  % ��ȡ
I1 = imresize(I,0.5);  % ͼ����СΪԭ����һ��
I2 = rgb2gray(I);  % ����ɫͼ��תΪ��ɫͼ��
I3 = imrotate(I, 45);  % ��ת45�㣬��ʱ��
figure
subplot(221);imshow(I);
subplot(222);imshow(I1);
subplot(223);imshow(I2);
subplot(224);imshow(I3);

%% ���
clear;clc;
y = fun(10);
y

