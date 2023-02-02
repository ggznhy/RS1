% ʵ���� ͼ��ԭ

%% ���ָ�ԭ����
% deconvwnr:ά���˲���ԭ
% deconvreg:Լ����С���˸�ԭ
% deconvblind:ʹ��ä�����ָ�
% fspecial : ����ָ�����͵Ķ�ά�˲���

%% ���ӣ�ά���˲���ԭ
f = checkerboard(8);  % ����ͼ��
subplot(221), imshow(f),title('ԭʼͼ��');
PSF = fspecial('motion',7,45);  % ���ɵ���ɢ����
gb = imfilter(f,PSF, 'circular');
noise = imnoise(zeros(size(f)), 'gaussian', 0, 0.001);  % ����
g = gb + noise;  % �����������ͼ��
subplot(222); imshow(g);title('�˻�ͼ��');
Sn = abs(fft2(noise)).^2;  % ��������������
Sf = abs(fft2(f)).^2;  % ����ͼ������
NCORR = fftshift(real(ifft2(Sn)));  % �����������ϵ��
ICORR = fftshift(real(ifft2(Sf)));  % ԭͼ��������ϵ��
fr = deconvwnr(g, PSF, NCORR, ICORR);
subplot(223); imshow(fr); title('ά���˲�ͼ��');

%% ����Ҷ�任����Ҫ�ú����