%2011.12.29
%��������:�²������²����ı�����2~4֮��
%���������(1)hr:�߷ֱ���ͼ��
%         (2)k:�²�������
%�������:(1)lr:�²������ͼ��

function lr = downs(hr,k)%�������ÿ����˵��k����ȡһ��

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