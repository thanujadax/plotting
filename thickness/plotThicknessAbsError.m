function plotThicknessAbsError()

sporring = [18.26,18.87,14.11].*100 ./70;
sporring_sem = [1.04,2.75,1.81].*100 ./70;
ours = [9.91,15.81,12.25].*100 ./70;
ours_sem = [1.97,3.64,1.96].*100 ./70;

x = 1:3;

figure;
scatter(x,ours,50,'filled');
hold on
scatter(x,sporring,50,'filled');
errorbar(x,sporring,sporring_sem,'.k');
errorbar(x,ours,ours_sem,'.k');

hold off

ax = gca;
xticklabels = get(ax,'XTickLabel');
xticklabels{1} = '';
xticklabels{2} = 'S1';
xticklabels{3} = '';
xticklabels{4} = 'S2';
xticklabels{5} = '';
xticklabels{6} = 'S3';
xticklabels{7} = '';
set(ax,'XTickLabel',xticklabels) % set tick labels to updated value

legend('Ours','Sporring')

xlabel('Sample ID')
ylabel('Mean absolute error %')
