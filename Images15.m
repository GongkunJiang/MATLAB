close all;clc,clear
box on
hold on
grid on
N=64;
xlabel('x_n');
ylabel('Density probability(%)');
title(['N=' num2str(N)]);
set(gca, 'FontSize', 15);
set(gca,'XLim',[0 1]);
set(gca,'YLim',[0 1.25]);
set(gca, 'XTick',0:0.2:1);
set(gca, 'YTick',0:0.25:1.25);
set(gca,'yTickLabel',num2str(get(gca,'yTick')','%.2f'))

x0=rand(1);m=0.01;k0=m+(4-2*m)*rand(1);N=64;
x = x0;k=k0;s=0.001;
num=zeros(1,10000);
for i=1:10000   
    x0=PLM(N,k,x0);
    num(i)=x0;
    k = k + s;
    if k>(4-m)
        k=k-(4-m);
    end
    if k<m
        k=m;
    end 
end

count = zeros(1,1000);
for i=1:10000
    min = 0;
    for j =1:1000
        max = j/1000;
        if (num(i)>=min && num(i)<max)
            count(j)=count(j)+1;
        end
        min = max;
    end
end
j =0.001:0.001:1;
plot(j,count/100,'-b');
hold off
saveas(gcf,['images/img15_N' num2str(N)],'png');      

function y=PLM(N,k,x0)
    if x0>0&&x0<1/N
        y = k.*N^2.*x0.*(1/N-x0);       
    elseif x0>1/N&&x0<1
        for j=1:2:(N-1)
            if x0>j/N&&x0<(j+1)/N
                y=1-k.*N^2.*(x0-j/N).*((j+1)/N-x0);
            end
        end
        for j=2:2:(N-1)
            if x0>j/N&&x0<(j+1)/N
                y=k.*N^2.*(x0-j/N)*((j+1)/N-x0);                
            end
        end

    elseif x0==1
        y=x0-1/(100*N);        
    else
        y=x0+1/(100*N);      
    end
end 

