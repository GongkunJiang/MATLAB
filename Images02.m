close all;clc,clear
k = 4;
box on
hold on
grid on
xlabel('n');
ylabel('x_n')
title(['\mu=',num2str(k)]);
set(gca, 'FontSize', 20);
set(gca,'XLim',[0 10000]);
set(gca,'YLim',[0 1]);
set(gca, 'XTick',0:5000:10000);
set(gca, 'YTick',0:0.5:1);  
y = @(k,x)k*x.*(1-x);
x0 = rand(1);
for i=1:10000
    plot(i,y(k,x0),'.b');
    x0=y(k,x0);
end
hold off
saveas(gcf,['images/img02_',num2str(k*100)],'png');