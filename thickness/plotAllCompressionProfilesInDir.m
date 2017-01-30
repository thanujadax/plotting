function plotAllCompressionProfilesInDir()

compressionTxtFilePath = '/home/thanuja/RESULTS/sectionThickness/ssSEM_70nm/r2_c1_0_20_2/orientationsTest/001_sig_2/compressionEstimates';

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
hold off


%% plot mean compression for each rotation
figure;
plot(compressionVectMean,'LineWidth',2.5)
% xticks([0:10:180]);
% set(gca,'xtick','0','10','20','30','40','50','60','70','80','90','100','110',...
%    '120','130','140','150','160','170','180')
set(gca,'xticklabel',0:10:180)
