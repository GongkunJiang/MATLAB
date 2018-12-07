function y=D2B(innum,N)
%十进制小数转换为二进制数
%输入参数为innum 和N
%innum 为输入的十进制小数
%N为指定转换后二进制的位数
if (innum>1)||(N == 0)% 判断输入的有效性
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
    tempnum=tempnum*2;% 小数转换为二进制,乘2 取整
    if tempnum>1
        record=strcat(record,'1');
        tempnum=tempnum-1;
    else
        record=strcat(record,'0');
    end
end
y=record;