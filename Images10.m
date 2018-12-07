close all;clc,clear
box on
hold on
grid on
N=64;
xlabel('\mu');
ylabel('x_n');
title([' N=',num2str(N)]);
set(gca, 'FontSize', 15);
set(gca,'XLim',[0 4]);
set(gca,'YLim',[0 1]);
set(gca, 'XTick',0:1:4);
set(gca, 'YTick',0:0.2:1);
x0=rand(1);
for k = 0:0.01:4
    for b = 1:300
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
        x0=y;
        if b>200
            plot(k,x0,'.b')
        end
    end
end

saveas(gcf,['images/img10_N',num2str(N)],'png');







