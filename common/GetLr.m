% get Lr image from Hr image
function Lr = GetLr(Hr,par, K )

[m,n,d] = size(Hr);

for i = 1:d
    blI(:,:,i) = blur_Guass(Hr(:,:,i),par ); %编的高斯模糊函数   对图像进行模糊
    Lr(:,:,i) = downs(blI(:,:,i),K);      %编的下采样函数      对模糊后的图像进行下采样
end

return;