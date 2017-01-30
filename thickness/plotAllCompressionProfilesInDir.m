function plotAllCompressionProfilesInDir()

compressionTxtFilePath = '/home/thanuja/RESULTS/sectionThickness/ssSEM_70nm/r2_c1_0_20_2/orientationsTest/001_sig_2/compressionEstimates';

fileList = dir(fullfile(compressionTxtFilePath,'*.txt'));

% from each file, read the list of compression estimates and plot in the
% same figure
figure;
hold on
for i=1:length(fileList)
    fid = fopen(fullfile(compressionTxtFilePath,fileList(i).name),'r'); 
    comEst = fscanf(fid,'%f');
    plot(comEst)
end
hold off