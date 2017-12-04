function rssim = GetSsim(I1,I2);

[n1,m1,ch1]=size(I1);
[n2,m2,ch2]=size(I2);
n = min(n1,n2);
m = min(m1,m2);
ch = min(ch1,ch2);
A = I1(1:n,1:m,1:ch);
B = I2(1:n,1:m,1:ch);

A = uint8(A);
B = uint8(B);
if ch ==1
    rssim = ssim(A,B);
else
    for i = 1:ch
    ssm(i) = ssim(A(:,:,i),B(:,:,i));
    end
    rssim = mean(ssm);
end