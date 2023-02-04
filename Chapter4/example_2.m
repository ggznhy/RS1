% ʵ��� ң��ͼ����ǿ

%% ���ݵ��� 
example_1;
close all;

%% ֱ��ͼ���⻯

src_img = data(:, :, 5);  % ѡȡ��4����
min_val2 = min(min(src_img));  % ��k�����ε���Сֵ
max_val2 = max(max(src_img));  % ���ֵ
% �����Ԫpixel����
for i = 1:lines  % ��
    for j = 1:samples  % ��
        % ������ֵ��һ�����ٳ�255��������Ԫֵ������0С��255��
        src_img(i,j) = ((src_img(i,j) - min_val2) / (max_val2 - min_val2)) * 255;
    end
end
src_img = uint8(src_img);
figure(1);
subplot(221), imshow(src_img), title('ԭͼ��');  % ��ʾԭͼ��
subplot(222), imhist(src_img), title('ԭͼ��ֱ��ͼ');  % ԭͼֱ��ͼ
matlab_eq = histeq(src_img);  % ֱ��ͼ���⻯
subplot(223), imshow(matlab_eq), title('matlabֱ��ͼ���⻯ͼ��');  % ֱ��ͼ���⻯ԭͼ��
subplot(224), imhist(matlab_eq), title('matlab���⻯��ֱ��ͼ');  % ���⻯��ֱ��ͼ

%% ָ���任
close all;
% c = 1.0 r=0.4
Gamma = 0.4;
C = 1;
g = data(:, :, 6);
g = C * (g .^ Gamma);
% ��һ��
min_val2 = min(min(g));  % ��k�����ε���Сֵ
max_val2 = max(max(g));  % ���ֵ
% �����Ԫpixel����
for i = 1:lines  % ��
    for j = 1:samples  % ��
        % ������ֵ��һ�����ٳ�255��������Ԫֵ������0С��255��
        g(i,j) = ((g(i,j) - min_val2) / (max_val2 - min_val2)) * 255;
    end
end
g = uint8(g);
figure(2);
subplot(221), imshow(g), xlabel('a).Original Image');  % ��ʾԭͼ��
subplot(222), imhist(g), title('Original Image Histogram');  % ԭͼֱ��ͼ
matlab_eq1 = histeq(g);  % ֱ��ͼ���⻯
subplot(223), imshow(matlab_eq1), xlabel('b).Gamma Transformations \gamma = 0.4');
subplot(224), imhist(matlab_eq1), title('Ehanced Image Histogram');  


%% �����任
% ������eval
c = 0.1;
g = double(src_img);
v1 = 10;
v2 = 100;
v3 = 200;
g1 = c * log2(1 + v1 * g) / log(v1 + 1);
g2 = c * log2(1 + v2 * g) / log(v2 + 1);
g3 = c * log2(1 + v3 * g) / log(v3 + 1);
% ��һ��
max_v1 = max(max(g1));
min_v1 = min(min(g1))
max_v2 = max(max(g2));
min_v2 = min(min(g2))
max_v3 = max(max(g3));
min_v3 = min(min(g3))
for i = 1:lines
    for j = 1:samples
        g1(i, j) = (g1(i, j)-min_v1) / (max_v1 - min_v1) * 255;
        g2(i, j) = (g2(i, j)-min_v2) / (max_v2 - min_v2) * 255;
        g3(i, j) = (g3(i, j)-min_v3) / (max_v3 - min_v3) * 255;
    end
end
g = uint8(g);
g1 = uint8(g1);
g2 = uint8(g2);
g3 = uint8(g3);
figure(3);
subplot(221), imshow(g), xlabel('a).Original Image');  % ��ʾԭͼ��
subplot(222), imshow(g1), xlabel('c).Log Transformation v=10');  
subplot(223), imshow(g2), xlabel('b).Log Transformation v=100');  
subplot(224), imshow(g3), xlabel('d).Log Transformation v=200');

%% ��������
close all;  % ǰͼ
g = double(src_img);
[m, n, k] = size(g);
figure(4);
imshow(src_img); title('Original Image');
mid = mean(mean(g));
% ����
fa = 20; fb = 120;
% ����
ga = 100; gb = 255;
[height, width] = size(g);
dst_img = uint8(zeros(height,width));
g = double(g);

% ����б��
k1 = ga / fa;
k2 = (gb-ga)/ (fb-fa);
k3 = (255 - gb) / (255-fb);
for i = 1 : height
    for j = 1 : width
        if g(i,j) <= fa
            dst_img(i,j) = k1 * g(i,j);
        elseif fa<g(i,j) && g(i,j) <= fb
            dst_img(i,j) = k2 * (g(i,j) - fa) + ga;
        else
            dst_img(i,j) = k3 * (g(i,j)-fb) + gb;
        end
    end
end
dst_img = uint8(dst_img);
J = dst_img;
figure(5)
imshow(J);title('��������ͼ��');

pixel_f = 1:256;
pixel_g = zeros(1, 256);

% ����б�ʣ�С��1��ʾ���߶ν�������
k1 = double(ga / fa);
k2 = (gb-ga)/ (fb-fa);
k3 = (256 - gb) / (256-fb);
for i = 1 :256
    if i <= fa
        pixel_g(i) = k1 * i;
    elseif fa < i && i<=fb
        pixel_g(i) = k2 * (i - fa) + ga;
    else
        pixel_g(i) = k3 * (i - fa) + gb;
    end
end
figure(6)
plot(pixel_f, pixel_g);
