%2011.12.29
%��������:ʵ��2����˫������ֵ�Ŵ�
%���������l:���Ŵ�ĵͷֱ���ͼ��
%���������sr:�Ŵ��ĸ߷ֱ���ͼ��

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
