close all;clc,clear
box on
hold on
grid on
xlabel('n');
ylabel('x_n');
set(gca, 'FontSize', 15);
set(gca,'XLim',[0 30]);
set(gca,'YLim',[0 1.05]);
set(gca, 'XTick',0:5:30);
set(gca, 'YTick',[0:0.2:1.05 1.05]);
y = @(k,x)k*x.*(1-x);
x0=rand(1);k=4;x=x0;
logistic = zeros(1,30);
for i=1:30
    f=y(k,x);
    x=f;
    logistic(i) = x;
end
i=1:30;
plot(i,logistic,'-ob');
M = zeros(1,30);k=4;
for N = [4 12 16]
    for i = 1:30
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
        x0=y;
    end
    i = 1:30;
    if N==4
        plot(i,M,'-*r'); 
    elseif N==12
        plot(i,M,'-pg');
    else
        plot(i,M,'-dk');
    end
end

legend('logistic','N=4','N=12','N=16','Location','NorthEastOutside');
hold off
saveas(gcf,'images/img07','png');










