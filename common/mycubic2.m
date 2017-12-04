%2011.12.29
%函数功能:实现2倍的双立方插值放大
%输入参数：l:待放大的低分辨率图像
%输出参数：sr:放大后的高分辨率图像

function sr = mycubic2(l)
sr= interp2(l,'cubic');
[m,n]=size(sr);

for loop= 1:n
    sr(m+1,loop)=sr(m,loop);
end

for loop = 1:m
    sr(loop,n+1)=sr(loop,n);
end
sr(m+1,n+1)=sr(m,n);
