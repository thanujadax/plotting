function plotAllCompressionProfilesInDir()

% compressionTxtFilePath = '/home/thanuja/RESULTS/sectionThickness/ssSEM_70nm/r2_c1_0_20_2/orientationsTest/001_sig_2/compressionEstimates';
compressionTxtFilePath = '/home/thanuja/RESULTS/sectionThickness/ssSEM_70nm/2305/compressionEstimates';
fileList = dir(fullfile(compressionTxtFilePath,'*.txt'));

% from each file, read the list of compression estimates and plot in the
% same figure
numRotations = numel(fileList);
compressionVectMean = zeros(numRotations,1);
compressionVectSd = zeros(numRotations,1);

figure;
hold on
for i=1:length(fileList)
    fid = fopen(fullfile(compressionTxtFilePath,fileList(i).name),'r'); 
    comEst = fscanf(fid,'%f');
    plot(comEst,'LineWidth',2.5)
    compressionVectMean(i) = mean(comEst);
    compressionVectSd(i) = std(comEst);
end
fclose(fid);
hold off


%% plot mean compression for each rotation
figure;
x = 0:10:180;
plot(x,compressionVectMean,'LineWidth',2.5)
ylabel('\gamma_{yx}')
xlabel('Rotation of the stack (degrees)')
% ax = gca;
% xticklabels = get(ax,'XTickLabel');
% 
% xticklabels{1} = '0';
% xticklabels{2} = '45';
% xticklabels{3} = '90';
% xticklabels{4} = '135';
% xticklabels{5} = '180';
% set(ax,'XTickLabel',xticklabels) % set tick labels to updated values

% function H=shadedErrorBar(x,y,errBar,lineProps,transparent)
figure;
shadedErrorBar(x,compressionVectMean,compressionVectSd,...
    {'-b','LineWidth',2.5},0.5,'','','');
ylabel('\gamma_{yx}')
xlabel('Rotation of the stack (degrees)')
set(gca,'FontSize',16);

