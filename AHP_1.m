%% 
disp('�������жϾ���A(n��)');
A=input('A=');
[n,n]=size(A);
x=ones(n,100);
y=ones(n,100);
m=zeros(1,100);
m(1)=max(x(:,1));
y(:,1)=x(:,1);
x(:,2)=A*y(:,1);
m(2)=max(x(:,2));
y(:,2)=x(:,2)/m(2);
p=0.0001;i=2;k=abs(m(2)-m(1));
while  k>p
  i=i+1;
  x(:,i)=A*y(:,i-1);
  m(i)=max(x(:,i));
  y(:,i)=x(:,i)/m(i);
  k=abs(m(i)-m(i-1));
end
a=sum(y(:,i));
w=y(:,i)/a;
t=m(i);
disp('Ȩ��ϵ��w=');disp(w);
disp('t=');disp(t);
         %������һ���Լ���
CI=(t-n)/(n-1);
RI=[0 0 0.52 0.89 1.12 1.26 1.36 1.41 1.46 1.49 1.52 1.54 1.56 1.58 1.59]; %RI��15��
CR=CI/RI(n);
if CR<0.10
    disp('�˾����һ���Կ��Խ���!');
    disp('CI=');disp(CI);
    disp('CR=');disp(CR);
end



%% 
function AHPInit1(x,y)
%��η����ĳ�ʼ��
%Ĭ��ֻ������ xΪ׼������yΪ������
%CToTΪ׼���Ŀ�����ɵıȽ���
%EigOfCriΪ׼������������
%EigOfOptΪѡ������������
EigOfCri=zeros(x,1);%׼������������
EigOfOpt=zeros(y,x);
dim=x;%ά��
RI=[0 0 0.58 0.90 1.12 1.24 1.32 1.41 1.45 1.49 1.51];%RI��׼
%���ɳɶԱȽ���
  for i=1:dim
        CToT(i,:)=input('����������:');
  end
CToT %���
pause,
tempmatrix=zeros(x+1);
tempmatrix=AHP1(dim,CToT);
EigOfCri=tempmatrix(1:x);
ci1=tempmatrix(1+x);
EigOfCri
ci1
pause,
matrix=cell(x);%Ԫ������
ci=zeros(1,x);
dim=y;
  for k=1:x
    matrix{k}=zeros(dim,dim);
%���ɳɶԱȽ���
    for i=1:dim
        matrix{k}(i,:)=input('����������:');
    end
%�жϸñȽ����ǲ���һ����
tempmatrix=zeros(y+1);
tempmatrix=AHP1(dim,matrix{k});
EigOfOpt(:,k)=tempmatrix(1:y);
ci(k)=tempmatrix(y+1);
EigOfOpt(:,k)
ci(k)
pause,
  end
%����������һ���Լ��
RI=[0 0 0.58 0.90 1.12 1.24 1.32 1.41 1.45 1.49 1.51];
CR=ci1/RI(x)+ci*EigOfCri/RI(y);
CR
  if CR>0.1
    disp('���һ���Բ�ͨ��������������')
    return
  end
%������ݱȽ���Ľ���������
result=EigOfOpt*EigOfCri;
result
end


%% 
function f=AHP1(dim,CmpMatrix)
RI=[0 0 0.58 0.90 1.12 1.24 1.32 1.41 1.45 1.49 1.51]; %RI:11��
%�жϸñȽ����ǲ���һ����
%�жϸñȽ����ǲ���һ����
[V,D]=eig(CmpMatrix);%�����������������ֵ
%����������ֵ��������Ӧ����������
tempNum=D(1,1);
pos=1;
for h=1:dim
    if D(h,h)>tempNum
        tempNum=D(h,h);
        pos=h;
    end
end    
eigVector=V(:,pos);
maxeig=D(pos,pos);
maxeig
dim
CI=(maxeig-dim)/(dim-1);
CR=CI/RI(dim);
if CR>0.1
    disp('׼���Ŀ��Ӱ����������ɵľ�����һ��������������')
    return
end
CI
%��һ��
sum=0;
for h=1:dim
    sum=sum+eigVector(h);
end
sum
pause,
for h=1:dim
    eigVector(h)=eigVector(h)/sum;
end
f=[eigVector;CI];

end 