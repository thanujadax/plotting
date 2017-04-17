function plotDeformationComparison()

volIDs = {'2204','2305','2404','2519','2603','2703'};

measuredDeformation = [0.83,0.82,0.86,0.84,0.84,0.84];
deformationErr = [0.0202,0.0239,0.0262,0.0161,0.0215,0.0153];

gammaEst = [1.06, 0.94, 0.92, 0.87, 0.9363, 0.9386];
gammaErr = [0.0357,0.0043,0.0146,0.0085,0.0094,0.0131];

x = 1:6;

figure;
%scatter(x,measuredDeformation,50,'filled');
hold on
scatter(x,gammaEst,50,'filled');
%errorbar(x,measuredDeformation,deformationErr,'.k')
errorbar(x,gammaEst,gammaErr,'.k')
hold off
ax = gca;
xticklabels = get(ax,'XTickLabel');
xticklabels{1} = '';
xticklabels{2} = '2204';
xticklabels{3} = '2305';
xticklabels{4} = '2404';
xticklabels{5} = '2519';
xticklabels{6} = '2603';
xticklabels{7} = '2703';
xticklabels{8} = '';

set(ax,'XTickLabel',xticklabels) % set tick labels to updated value

% legend('measured deformation','estimated stretching')

xlabel('Volume ID')
% ylabel('deformation or stretching')
ylabel('Estimated stretching \gamma_{yx}')