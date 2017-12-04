function im = cropim(im,k)
[m,n,d] = size(im);
m = m - mod(m,k);
n = n - mod(n,k);
im = im(1:m,1:n,1:d);
