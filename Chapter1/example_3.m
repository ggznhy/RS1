% ��ͼ
clear; clc;

%% ͼ�δ���
% axis �������������
% axis([1 10, 2 18])

% �̶�����
% set(gca,'Xtick',xs, 'Ytick', ys, 'Ztick', zs)  % gca�Ǿ��

% �ָ���
% gird off;
% gird on;

% ͼ�α�ʶ
% title('graphic example');
% xlabel('x'); ylabel('y');
% legend('s1','s2');
% text(x, y, 's')  % ע��

% ��ͼ����
% figure(n)  % �򿪵�n��ͼ�δ���
% clf  % ���ͼ�δ���
% hold on  % ��ͼ����
% hold off  % ȡ����ͼ����
% subplot(mmk)  % ��ͼ�δ��ڷֳ�m*n����ͼ���ڵ�k����ͼ�ϻ�ͼ

%% ��ά��ͼ����
x = [0 : 0.01 : 2*pi];
y1 = linspace(0, 0, length(x))
y2 = sin(x);
% plot(x, y1);
% plot(x, y2);
plot(x,y1,'r:', x, y2, 'b-')

%% ��ά��ͼ����

% plot3()

%% ������ͼ����
% bar stairs stem fill scatter bar3 pie3 fill3 contour contour3



