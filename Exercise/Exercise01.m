hold on
t=1:0.01:2;
f=t.^2;  g=sin(2*pi*t);
plot(t,f,'k',t,g,'ro');
xlabel('Time(ms)');
ylabel('f(t)')
title('Mini Assignment #1');
legend('t^2','sin(2\pi t)','location','NorthWest');
hold off
