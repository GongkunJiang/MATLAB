close all;clc,clear
box on
hold on
grid on
xlabel('N');
k=4;
ylabel('Lyapunov exponents');
title([' \mu=',num2str(k)]);
set(gca, 'FontSize', 15);
set(gca,'XLim',[0 100]);
set(gca,'YLim',[-4 6]);
set(gca, 'XTick',0:20:100);
set(gca, 'YTick',-4:2:6);
lyap=zeros(1,50);
lyp=0;j=0;
for N=2:2:100
    x0=rand(1);
    j=j+1;
    for b=1:10000
        lyp = lyp+log(abs(dif(N,k,x0)));
        x0=plm(N,k,x0);
    end 
    lyp=lyp/b;
    lyap(j)=lyp;    
end
N=2:2:100;
plot(N,lyap,'-db','MarkerFaceColor','b');
hold off
saveas(gcf,['images/img11_k' num2str(k*100)],'png');
function y=plm(N,k,x0)
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
function y=dif(N,k,x0)
    if x0>0&&x0<1/N
        y = k.*N^2.*(1/N-2.*x0);       
    elseif x0>1/N&&x0<1
        for j=1:2:(N-1)
            if x0>j/N&&x0<(j+1)/N
                y=1-k.*N^2.*((2.*j+1)/N-2.*x0);
            end
        end
        for j=2:2:(N-1)
            if x0>j/N&&x0<(j+1)/N
                y=k.*N^2.*((2.*j+1)/N-2.*x0);                
            end
        end        
    else
        y=1;      
    end
end
