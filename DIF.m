function y=DIF(N,k,x0)
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