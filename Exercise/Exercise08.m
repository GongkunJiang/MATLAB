G = [46 38 29 24 13]; S = [29 27 17 26 8];
B = [29 23 19 32 7]; h = bar(1:5, [G' S' B']);
title('Medal count for top 5 countries in 2012 Olympics');
ylabel('Number of medals'); xlabel('Country');
legend('Gold', 'Silver', 'Bronze')
set(h(1),'FaceColor',[174/255 174/255 0]);
set(h(2),'FaceColor',[109/255 109/255 109/255]);
set(h(3),'FaceColor',[120/255 90/255 46/255]);
set(gca, 'XTickLabel', {'USA', 'CHN', 'GBR', 'RUS', 'KOR'});