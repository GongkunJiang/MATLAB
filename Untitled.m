clear;
x0=rand(1);m=0.01;k0=m+(4-2*m)*rand(1);N=64;
x = x0;k=k0;s=0.001;
num=zeros(1);bin=strings();
for i=1:1000 
    num(i)=PLM(N,k,x0);
    b=D2B(x0,16);
    bin(i)=b(9:16);
    k = k + s;
    if k>(4-m)
        k=k-(4-m);
    end
    if k<m
        k=m;
    end 
end