% ʵ��һ MATLAB��������

% 4)����ͼ��
x = [0 : 0.01 : 2*pi];
y = 2 * exp(-5*x) .* sin(2*pi*x);
plot(x,y,'r-.');
title('��ά����ͼ��');
legend('y');
xlabel('x');ylabel('y');