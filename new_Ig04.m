close all;clc,clear
box on
hold on
grid on
xlabel('\mu');
ylabel('Lyapunov exponents');
title('Logistic Map');
set(gca, 'FontSize', 20);
set(gca,'XLim',[3 4]);
set(gca,'YLim',[-5 1]);
set(gca, 'XTick',3:0.2:4);
set(gca, 'YTick',-5:1:1);  
y = @(k,x)k*x.*(1-x);

%Create array of all zeros
lyap=zeros(1,10000);
lyp=0;j=0;
for k0=3:0.0001:4
    x0=rand(1);
    j=j+1;
    for b=1:10000
        d=(rand(1)-0.5)/5000;
        k=k0*(1+d);
        lyp = lyp+log(abs(k-2*k*x0));
        x0=y(k,x0);
    end 
    lyp=lyp/b;
    lyap(j)=lyp;    
end
k=3:0.0001:4;
plot(k,lyap,'-b','LineWidth',2);
hold off