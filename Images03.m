close all;clc,clear
box on
hold on
grid on
xlabel('\mu');
ylabel('x_n')
title('N=1');
set(gca, 'FontSize', 20);
set(gca,'XLim',[0 4]);
set(gca,'YLim',[0 1]);
set(gca, 'XTick',0:1:4);
set(gca, 'YTick',0:0.2:1);  
y = @(k,x)k*x.*(1-x);
x0=rand(1);
for k=1:0.02:4
    for b = 1:300
        x0=y(k,x0);
        if b>150
            plot(k,x0,'.b')
        end
    end
end
hold off
saveas(gcf,'images/img03','png');