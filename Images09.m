close all;clc,clear
box on
hold on
grid on
k=4;N=64;
xlabel('n');
ylabel('x_n');
title(['\mu=',num2str(k),' N=',num2str(N)]);
set(gca, 'FontSize', 15);
set(gca,'XLim',[0 10000]);
set(gca,'YLim',[0 1]);
set(gca, 'XTick',0:5000:10000);
set(gca, 'YTick',0:0.5:1);
x0 = rand(1);
for i = 0:10000
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
    plot(i,y,'.b');
    x0=y;
end
%saveas(gcf,['images/img09_k',num2str(k*100),'_N',num2str(N)],'png');