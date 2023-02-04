%ʵ��һ ң��ͼ���д

clear, clc, close all;

%% 1.ң��ͼ��ͷ�ļ��Ķ�ȡ
hdrfilename = 'can_tmr/can_tmr.hdr';
fid = fopen(hdrfilename, 'r');
info = fread(fid, 'char=>char');
info = info';  % ת��Ϊ��������ʾ
fprintf('%s\n', info); % �����ӡ�����ʾ
fclose(fid);

%% ң��Ӱ��Ļ�����Ϣ��ȡ
% ��ȡ����������������������������
% ����
ac = strfind(info, 'samples = ');  % 'samples = '��info�е�λ��
bc = length('samples = ');  % �ַ�������
cc = strfind(info, 'lines');  % ...λ��
samples = [];
for i = ac+bc : cc-1
    samples = [samples, info(i)];
end
samples = str2num(samples);

% ����
ar = strfind(info, 'lines   = ');  % 'lines = '��info�е�λ��  3���ո�
br = length('lines   = ');  % �ַ�������
cr = strfind(info, 'bands   ');  % ...λ��
lines = [];
for i = ar+br : cr-1
    lines = [lines, info(i)];
end
lines = str2num(lines);

% ������
ab = strfind(info, 'bands   = ');  % 'lines = '��info�е�λ��  3���ո�
bb = length('bands   = ');  % �ַ�������
cb = strfind(info, 'header offset');  % ...λ��
bands = [];
for i = ab+bb : cb-1
    bands = [bands, info(i)];
end
bands = str2num(bands);

% ��������
at = strfind(info, 'data type = ');
bt = length('data type = ');
ct = strfind(info, 'interleave');
datatype = [];
for i = at + bt:ct-1
    datatype = [datatype, info(i)];
end
datatype = str2num(datatype);
precision = [];
switch datatype
    case 1
        precision = 'uint8=>uint8';  % ��Ӧ��ϵ
    case 2
        precision = 'int16=>int8';
    case 12
        precision = 'uint16=>uint16';
    case 3
        precision = 'int32=>int32';
    case 13
        precision = 'uint32=>uint32';
    case 4
        precision = 'float32=>float32';
    case 5
        precision = 'double=>double';
    otherwise
        error('invalid datatype');
        % �����ϼ��ֳ�����������֮�������������Ϊ��Ч��������
end

% ���ݸ�ʽ
ai = strfind(info, 'interleave = ');
bi = length('interleave = ');
ci = strfind(info, 'sensor type');
interleave = [];
for i = ai + bi:ci-1
    interleave = [interleave, info(i)];
end
interleave = strtrim(interleave);

% ���
fprintf('Lines = %i\nSamples = %i\nDataType = %s\n', lines,samples,interleave);

%% ң��ͼ�����ݶ�ȡ����ʾ
% ��ȡ����
imgfilename = 'can_tmr/can_tmr.img';  % ·��
fid = fopen(imgfilename, 'r');
% д����ʱ��uint���unit,���󣡣���
data = multibandread(imgfilename, [lines, samples, bands], precision, 0, interleave, 'ieee-le');
data = double(data); 
% ��ֵתΪ0-255������������ʾ
data_show = data;
for k = 1:bands
    min_val = min(data_show(:, :, k));  % ��k�����ε���Сֵ
    max_val = max(data_show(:, :, k));  % ���ֵ
    % �����Ԫpixel����
    for i = 1:lines  % ��
        for j = 1:samples  % ��
            % ������ֵ��һ�����ٳ�255��������Ԫֵ������0С��255��
            data_show(i,j,k) = uint8((data_show(i,j,k) - min_val) / (max_val - min_val) * 255 );
        end
    end
end
% ������ң��ͼ����ʾ
numArray = bands;
for i = 1 : numArray
    % eval�Զ���������
    eval(['im', num2str(i), '=', 'uint8(data_show(:, :, i))',';']);
end

subplot(231), imshow(im1);title('B1');
subplot(232), imshow(im2);title('B2');
subplot(233), imshow(im3);title('B3');
subplot(234), imshow(im4);title('B4');
subplot(235), imshow(im5);title('B5');
subplot(236), imshow(im6);title('B7');

% ���ɫ��ʾ
imtrclr = uint8(data_show(:, :, [3 2 1]));
figure(); imshow(imtrclr); title('���ɫ��ʾ');

% �ٲ�ɫ��ʾ
imflsclr = uint8(data_show(:, :, [4, 2, 1]));
figure(); imshow(imflsclr); title('�ٲ�ɫ��ʾ');


%% ң������ͼ�����ݴ洢
% ��BIL�洢���ʹ洢�ನ������
multibandwrite(imflsclr, 'imflsclr.bil', 'bil');

% �Դ洢32bit������Ϊ��
numBands = 1;
for band = 1:numBands
    multibandwrite(data(:,:,band), 'banddata.bsq', 'bsq');
end




