% MATLABͼ�������䣨�ص㣩

%% ������ͼ������
% ��ͼ��
% A = imread(filename, fmt);  % A Ӱ����������
% [X�� Map] = imread(filename, fmt); % X:ͼ�����ݣ� Map:��ص�ɫ��
% ��1
clear;  % �������
filename = "E:\MyCode\Matlab\MATLABң������ͼ����_ʵ���̳�\Chapter1\haha.jpg";
f = imread(filename);

% ��ʾͼ��
% imshow(f)
% imshow(f, [64, 128])
% ��2
subplot(121),imshow(f);
subplot(122),imshow(f, [64, 128]);

% ���ͼ������������Ϣ
whos f

% ��ȡͼ�����ϸ��Ϣ
imfinfo(filename);

% ����ͼ��
filename1 =  "E:\MyCode\Matlab\MATLABң������ͼ����_ʵ���̳�\Chapter1\haha.bmp";
imwrite(f, filename1);

%% MATLAB��֧�ֵ�ͼ������
% 1�����ɫ RGB 24λ  m��n��3
% 2������ͼ��[X, Map]
% 3) �Ҷ�ͼ�� 0-255
% 4����ֵͼ�� 0��1


%% OK