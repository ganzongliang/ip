%2011.12.21 
%�������ܣ���ʵ��2����3����4����˫������ֵ
%�������:(1)l�����ؽ��ĵͷֱ���ͼ��
%         (2)k:�Ŵ�����
%�������:sr:˫������ֵ�Ŵ���ͼ��

function sr = mycubic(l,k)
   l  = double(l);
switch k
    case 2,
        sr = mycubic2(l);%����ڲ庯��
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