% ʵ���� ң��ͼ���ں�

% ʾ��Ч�����Ǻܺ��ʣ�����qb_boulder�ļ��������ݽ�һ����ʾ

%% С���任�ں�
X1=data(:, :, 2);
min_val = min(min(X1));
max_val = max(max(X1));
for i = 1:lines
    for j = 1:samples
        X1(i,j) = (X1(i,j) - min_val) / (max_val - min_val) * 255;
    end
end
X1 = double(X1) / 256;
figure;
imshow(X1), title('�߷ֱ���');
axis square;
X2= data(:, :, 4);
min_val = min(min(X2));
max_val = max(max(X2));
for i= 1:lines
    for j= 1:samples
        X2(i,j) = (X2(i, j) - min_val) / (max_val - min_val) * 255;
    end
end
X2 = double(X2 ) / 256;
figure;
imshow(X2), title('�ͷֱ���');
axis square;
[c1,s1]= wavedec2(X1, 2, 'sym4 ');
%��x1����2ά,ʹ��'sym4 '���б任
sizec1 = size(c1);
for i= 1 : sizec1(2)
    c1(i)= 1.2 * c1(i);
    %���ֽ���ֵ������1.2��
end
[c2,s2] = wavedec2(X2, 2, 'sym4 ');
c=c1 + c2;
%����ƽ��ֵ
c=0.5*c;
s=s1 + s2;
s=0.5 * s;
xx = waverec2(c,s,' sym4 ');
%�����ع�
figure; imshow(xx), title('�ںϺ��ң��ͼ��');
axis square;

%% �Դ�������С����Ƶ�͸�Ƶ�ں�

X1 = data(:, :, 4);
min_val = min(min(X1));
max_val = max(max(X1));
for i= 1:lines
    for j = 1: samples
        X1(i, j) = (X1(i, j) - min_val) / (max_val - min_val) * 255;
    end
end

X2 = data(:, :, 2);
min_val = min(min(X2));
max_val = max(max(X2));
for i = 1:lines
    for j= 1:samples
        X2(i,j) = (X2(i, j) - min_val) / (max_val - min_val) * 255;
    end
end

XFUS = wfusimg(X1, X2,' sym4 ', 5, 'max', 'max');
min_val = min(min(XFUS));
max_val = max(max(XFUS));
for i= 1 : lines
    for j= 1 : samples
        XFUS(i, j) = (XFUS(i, j) - min_val) / ( max_val - min_val) * 255;
    end
end
%��ʾ�ںϺ�ͼ��
X1 = uint8(X1);
X2 = uint8(X2);
XFUS= uint8(XFUS);
subplot(131), imshow(X1), axis square, title('�߷ֱ���');
subplot(132), imshow(X2), axis square, title('�ͷֱ���');
subplot(133), imshow(XFUS), axis square, title('�ںϺ�ͼ��');


