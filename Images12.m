close all;clc,clear
box on
hold on
grid on
xlabel('\mu');
N=4;
ylabel('Lyapunov exponents');
title([' N=',num2str(N)]);
set(gca, 'FontSize', 15);
set(gca,'XLim',[0 4]);
set(gca,'YLim',[-3 6]);
set(gca, 'XTick',0:1:4);
set(gca, 'YTick',-2:2:6);
lyap=zeros(1);
lyp=0;j=0;
for k=0.01:0.01:4
    x0=rand(1);
    j=j+1;h=0;
    for b=1:10000
        % 只能说这是一个BUG，不用条件判断就会出-inf,用了就不会出
        if log(abs(dif(N,k,x0)))==-inf
            h = h + 1;
        else
            lyp = lyp+log(abs(dif(N,k,x0))); 
        end
        x0=plm(N,k,x0);
    end
    lyp=lyp/b;
    lyap(j)=lyp;    
end
k=0.01:0.01:4;
plot(k,lyap,'-b');
hold off
saveas(gcf,['images/img12_N' num2str(N)],'png');
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