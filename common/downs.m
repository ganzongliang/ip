%2011.12.29
%函数功能:下采样，下采样的倍数在2~4之间
%输入参数：(1)hr:高分辨率图像
%         (2)k:下采样倍数
%输出参数:(1)lr:下采样后的图像

function lr = downs(hr,k)%例如对于每行来说隔k个点取一个

% [m,n]=size(hr);
% for loopx= 1:(m/k)
%     for loopy = 1:(n/k)
%         xx= k*(loopx-1)+1;
%         yy= k*(loopy-1)+1;
%         lr(loopx,loopy) = hr(xx,yy); 
%     end
% end

[m,n,d]=size(hr);

for i =1:d
lr(:,:,i) =hr(1:k:end,1:k:end,i);
end

return;