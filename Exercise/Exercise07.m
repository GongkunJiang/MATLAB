t =(1:4)*pi/2; x = cos(t); y = sin(t);
h=fill(x,y,'y'); axis square off;
set(h,'linewidth',5);
text(0,0,'WAIT','Color', 'k', 'FontSize', 75, ...
'FontWeight','bold', 'HorizontalAlignment', 'center');