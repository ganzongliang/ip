%此函数只是一个中间步骤  为了处理包括3层数据的图像而加的


function Hr = upcubic(Lr,K )
[m,n,d]=size(Lr);

for i = 1:d
    Hr(:,:,i)= mycubic(Lr(:,:,i),K);  %编的内插函数
end
