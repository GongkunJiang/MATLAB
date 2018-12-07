close all;clc,clear
box on
hold on
grid on
xlabel('\mu');
ylabel('Density probability(%)');
title('\mu=4');
set(gca, 'FontSize', 15);
set(gca,'XLim',[0 1]);
set(gca,'YLim',[0 2.25]);
set(gca, 'XTick',0:0.2:1);
set(gca, 'YTick',[0:0.25:1.25 2:0.25:2.25]); 
set(gca,'yTickLabel',num2str(get(gca,'yTick')','%.2f'))
y = @(k,x)k*x.*(1-x);
x0=rand(1);k=4;
num=zeros(1,10000);
for i=1:10000
    num(i)=x0;
    x0=y(k,x0);
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
plot(j,count/100,'-b','LineWidth',1.5);
hold off
saveas(gcf,'images/img05','png');      
    
