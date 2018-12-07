close all;clc,clear
box on
hold on
grid on
k0=4;N=64;
xlabel('n');
ylabel('x_n');
title(['\mu=',num2str(k0),' N=',num2str(N)]);
set(gca, 'FontSize', 15);
set(gca,'XLim',[0 10000]);
set(gca,'YLim',[0 4]);
set(gca, 'XTick',0:5000:10000);
set(gca, 'YTick',0:0.5:4);
x0 = rand(1);
xn = zeros(1);
bn = zeros(1);
for i=1:10000
    b=(rand(1)-0.5)/500;
    bn(i) = b;
    k=k0*(1+b);
    xn(i)=x0;
    x0=PLM(N,k,x0);
    plot(i,x0,'.b');
end
function y=PLM(N,k,x0)
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
end
