function y=D2B(innum,N)
%ʮ����С��ת��Ϊ��������
%�������Ϊinnum ��N
%innum Ϊ�����ʮ����С��
%NΪָ��ת��������Ƶ�λ��
if (innum>1)||(N == 0)% �ж��������Ч��
    disp('error!');
    return;
end
count=0;
tempnum=innum;
record=[];
while(N)
    count=count+1;
    if count>N
        break;
    end
    tempnum=tempnum*2;% С��ת��Ϊ������,��2 ȡ��
    if tempnum>1
        record=strcat(record,'1');
        tempnum=tempnum-1;
    else
        record=strcat(record,'0');
    end
end
y=record;