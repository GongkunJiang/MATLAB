hold on;
t=0:1/5000:10;
f = sin(pi*t.^2/4);
plot(t,f,'b');
t=0:0.2:10;
f = sin(pi*t.^2/4);
stem(t,f,'r');
hold off;