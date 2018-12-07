close all;clear;clc;
k = 3.57;
box on
hold on
grid on
set(gca, 'XTick',0:0.2:1);  
set(gca, 'YTick',0:0.2:1);
xlabel('x_n');
ylabel('x_n_+_1')
title(['\mu=',num2str(k)]);
set(gca, 'FontSize', 20);
x = 0:0.0005:1;

y = @(k,x)k*x.*(1-x);
plot(x,k*x.*(1-x),'g');
x0=rand(1);
plot([x0 x0],[0 y(k,x0)],'-b');
max=0;
for i = 1:100
    plot([x0 y(k,x0)],[y(k,x0) y(k,x0)],'-b');
    plot([y(k,x0) y(k,x0)],[y(k,x0) y(k,y(k,x0))],'-b');
    x0 = y(k,x0);
    if max<x0
        max = x0;
    end
end
plot([0 max],[0 max],'r');
hold off
saveas(gcf,['images/img01_',num2str(k*100)],'pdf');