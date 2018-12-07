close all;clc,clear
box on
hold on
grid on
xlabel('x_n');
ylabel('x_n_+_1');
set(gca, 'FontSize', 15);
set(gca,'XLim',[0 1]);
set(gca,'YLim',[0 1]);
set(gca, 'XTick',0:0.2:1);
set(gca, 'YTick',0:0.2:1);
M = zeros(1,10000);N=4;
for k = [4 3.6 2]
    for i = 1:10000
        x0=i/10000;
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
        M(i) = y;
    end
    i = 0.0001:0.0001:1;
    if k==4
        plot(i,M,'-b');
    elseif k==3.6
        plot(i,M,':g','LineWidth',2);
    else
        plot(i,M,'-.k');
    end
end

legend('\mu=4','\mu=3.6','\mu=2','Location','NorthEastOutside');
hold off
saveas(gcf,'images/img08','png');
