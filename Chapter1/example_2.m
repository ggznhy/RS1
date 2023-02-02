% MATLAB矩阵操作
clear;clc;

%% 1）寻访矩阵中的数据
% x = [3 4 5 9 8]
% b = x(3)  % 寻访x第三个元素
% b = x([1 2 5])  % 寻访x的第1,2,5个元素
% b = x(1:3)
% b = x(3:end)
% b = x(find(x>3))  % 寻找大于3的元素构成矩阵
% b = x(3:-1:1)  % 由前3个数排列成矩阵
% b = x([1 2 3 4 4 3 2 1])  % 对元素的重复访问

%% 2）修改数据
% x = [1 2 3; 4, 5, 6; 7 8 9];
% x(2,2) = 8
% x(3,:) = 10

% x = ones(5)  % 5*5的元素值权威1的矩阵
% x(2:4, 2:4) = 0  % 修改2~4列和2~4行全为0


%% 3）插入、提取、拉长、置空
% % 插入
% x = 4:6; A = [x - 3; x; x + 3];
% % 提取
% B = A(1:2, 2:3)
% % 拉长
% C = A(:)  % 将A拉长成列
% % 置空
% A(:, 2) = []  % 删除A的第2列


%% 4）获取矩阵的大小、长度
A = [3:6; 1:4]
s = size(A)  % A的大小是2行4列
[r, c] = size(A)  % 获取行r,列c
r = size(A, 1)  % 获取行数
c = size(A, 2)  % 获取列数
n = length(A)  % 获取行数与列数中的较大者
