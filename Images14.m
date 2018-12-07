x0=rand(1);
m=0.01;
k0=m+(4-2*m)*rand(1);
N=64;

x = x0;k=k0;s=0.001;
condition = 1;
while(condition)
    x = PLM(N,k,x);
    k = k + s;
    if k>(4-m)
        k=k-(4-m);
    end
    if k<m
        k=m;
    end 
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