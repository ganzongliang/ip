% get Lr image from Hr image
function Lr = GetLr(Hr,par, K )

[m,n,d] = size(Hr);

for i = 1:d
    blI(:,:,i) = blur_Guass(Hr(:,:,i),par ); %��ĸ�˹ģ������   ��ͼ�����ģ��
    Lr(:,:,i) = downs(blI(:,:,i),K);      %����²�������      ��ģ�����ͼ������²���
end

return;