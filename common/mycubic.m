%2011.12.21 
%函数功能：可实现2倍，3倍及4倍的双立方插值
%输入参数:(1)l：待重建的低分辨率图像；
%         (2)k:放大倍数；
%输出参数:sr:双立方插值放大后的图像

function sr = mycubic(l,k)
   l  = double(l);
switch k
    case 2,
        sr = mycubic2(l);%编的内插函数
    case 4,
        sr = mycubic2(l);
        sr = mycubic2(sr);
    case 3,
        sr1 = imresize(l, k,'cubic');
        [m,n]=size(sr1);
        sr = sr1;
        sr(1:m-1,1:n-1)=sr1(2:m,2:n);
    otherwise
        disp('wrong!');
        sr = -1;
end 