%�˺���ֻ��һ���м䲽��  Ϊ�˴������3�����ݵ�ͼ����ӵ�


function Hr = upcubic(Lr,K )
[m,n,d]=size(Lr);

for i = 1:d
    Hr(:,:,i)= mycubic(Lr(:,:,i),K);  %����ڲ庯��
end
