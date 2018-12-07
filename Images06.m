close all;clc,clear
box on
hold on
grid on
N=4;k=2;
xlabel('x_n');
ylabel('x_n_+_1');
title(['N=' num2str(N) ' \mu=' num2str(k)]);
set(gca, 'FontSize', 15);
set(gca,'XLim',[0 1]);
set(gca,'YLim',[0 1]);
set(gca, 'XTick',0:0.2:1);
set(gca, 'YTick',0:0.2:1);
max=10000;M = zeros(1,max);
for i = 1:max
    x0=i/max;
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
    M(i)=y;
end
part=8;length=max/part;
for p = 0:part-1
    q = (1+p*length)/max:1/max:((p+1)*length-1)/max;
    plot(q,M(1+p*length:(p+1)*length-1),'-b');
end
%saveas(gcf,['images/img06_N',num2str(N),'_k',num2str(k)],'png');
hold off