function fx = fun(x)
%FUN �˴���ʾ�йش˺�����ժҪ
%   �򵥷ֶκ���
if x>1
    fx = x^2;
elseif x<=1 && x>-1
    fx = 1;
elseif x<=-1
    fx = 3+2*x;
end
end

