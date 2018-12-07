a = [10 5 20 30];
subplot(1,5,1); pie(a);
subplot(1,5,2); pie(a, [0,0,0,1]);
subplot(1,5,3); pie3(a, [0,0,0,1]);

subplot(1,5,4); pie(a, [1,1,1,1]);
subplot(1,5,5); pie3(a, [1,1,1,1]);