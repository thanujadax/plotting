function plotFromTextFiles()

file_afm = '/home/thanuja/RESULTS/sectionThickness/ssSEM_70nm/afm_1_20.txt';

file_our_r1_c1_x = '/home/thanuja/RESULTS/sectionThickness/ssSEM_70nm/r1_c1_0_20/001_sig_2/thicknessPredictions/SDI/r1_c1_0_20_aligned/1/Prediction_r1_c1_0_20_aligned_wErrBar.dat';
file_our_r1_c1_y = '/home/thanuja/RESULTS/sectionThickness/ssSEM_70nm/r1_c1_0_20/001_sig_2/thicknessPredictions/SDI/r1_c1_0_20_aligned/2/Prediction_r1_c1_0_20_aligned_wErrBar.dat';
file_sporring_r1_c1 = '/home/thanuja/RESULTS/sectionThickness/ssSEM_70nm/r1_c1_0_20/sporring.mat';

file_our_r2_c1_x = '/home/thanuja/RESULTS/sectionThickness/ssSEM_70nm/r2_c1_0_20/001_sig_2/thicknessPredictions/SDI/r2_c1_0_20_aligned/1/Prediction_r2_c1_0_20_aligned_wErrBar.dat';
file_our_r2_c1_y = '/home/thanuja/RESULTS/sectionThickness/ssSEM_70nm/r2_c1_0_20/001_sig_2/thicknessPredictions/SDI/r2_c1_0_20_aligned/2/Prediction_r2_c1_0_20_aligned_wErrBar.dat';
file_sporring_r2_c1 = '/home/thanuja/RESULTS/sectionThickness/ssSEM_70nm/r2_c1_0_20/sporring.mat';

file_our_r2_c1_2_x = '/home/thanuja/RESULTS/sectionThickness/ssSEM_70nm/r2_c1_0_20_2/001_sig_2/thicknessPredictions/SDI/r2_c1_0_20_aligned_2/1/Prediction_r2_c1_0_20_aligned_2_wErrBar.dat';
file_our_r2_c1_2_y = '/home/thanuja/RESULTS/sectionThickness/ssSEM_70nm/r2_c1_0_20_2/001_sig_2/thicknessPredictions/SDI/r2_c1_0_20_aligned_2/2/Prediction_r2_c1_0_20_aligned_2_wErrBar.dat';
file_sporring_r2_c1_2 = '/home/thanuja/RESULTS/sectionThickness/ssSEM_70nm/r2_c1_0_20_2/sporring.mat';

% AFM measurements
fid = fopen(file_afm,'r');
afm = fscanf(fid,'%f\n');

%% subsample1
% our x 
fid = fopen(file_our_r1_c1_x,'r');
sub1_our_x = fscanf(fid,'%f ');
% our y
fid = fopen(file_our_r1_c1_y,'r');
sub1_our_y = fscanf(fid,'%f ');
% sporring
s = load(file_sporring_r1_c1);
sub1_sporring = s.f;

% plot subsample 1
figure;
x = 1:20;
% plot(x,sub1_our_x,x,sub1_our_y,x,sub1_sporring,x,afm,'LineWidth',2.5);
plot(x,sub1_our_y,'-+',x,sub1_sporring,'-o',x,afm,':','LineWidth',2.5);
axis([1 20 30 110])
legend('Ours','Sporring','AFM','FontSize',14)
ylabel('Thickness estimate (nm)','FontSize',14)
xlabel('section ID','FontSize',14)

disp('subsample 1')
disp('RMS error sporring')
rmserror(afm,sub1_sporring)
disp('ABS error sporring')
[err,sem] = meanabserror(afm,sub1_sporring)
disp('RMS error ours')
rmserror(afm,sub1_our_y)
disp('ABS error ours')
[err,sem] = meanabserror(afm,sub1_our_y)

%% subsample2
% our x
fid = fopen(file_our_r2_c1_x,'r');
sub2_our_x = fscanf(fid,'%f ');
% our y
fid = fopen(file_our_r2_c1_y,'r');
sub2_our_y = fscanf(fid,'%f ');
% sporring
s = load(file_sporring_r2_c1);
sub2_sporring = s.f;

% plot subsample 1
figure;
x = 1:20;
% plot(x,sub2_our_x,x,sub2_our_y,x,sub2_sporring,x,afm,'LineWidth',2.5);
plot(x,sub2_our_y,'-+',x,sub2_sporring,'-o',x,afm,':','LineWidth',2.5);
legend('Ours','Sporring','AFM','FontSize',14)
ylabel('Thickness estimate (nm)','FontSize',14)
xlabel('section ID','FontSize',14)

disp('subsample 2')
disp('RMS error sporring')
rmserror(afm,sub2_sporring)
disp('ABS error sporring')
[err,sem] = meanabserror(afm,sub2_sporring)
disp('RMS error ours')
rmserror(afm,sub2_our_y)
disp('ABS error ours')
[err,sem] = meanabserror(afm,sub2_our_y)
%% subsample3
% our x
fid = fopen(file_our_r2_c1_2_x,'r');
sub3_our_x = fscanf(fid,'%f ');
% our y
fid = fopen(file_our_r2_c1_2_y,'r');
sub3_our_y = fscanf(fid,'%f ');
% sporring
s = load(file_sporring_r2_c1_2);
sub3_sporring = s.f;

% plot subsample 2
figure;
x = 1:20;
plot(x,sub3_our_y,'-+',x,sub3_sporring,'-o',x,afm,':','LineWidth',2.5);
legend('Ours','Sporring','AFM','FontSize',14)
ylabel('Thickness estimate (nm)','FontSize',14)
xlabel('section ID','FontSize',14)

disp('subsample 3')
disp('RMS error sporring')
rmserror(afm,sub3_sporring)
disp('ABS error sporring')
[err,sem] = meanabserror(afm,sub3_sporring)
disp('RMS error ours')
rmserror(afm,sub3_our_y)
disp('ABS error ours')
[err,sem] = meanabserror(afm,sub3_our_y)
%% Stats
% avg_afm = mean(afm)
% std_afm = std(afm)
% 
% avg_sub1_gpy = mean(sub1_our_y)
% std_sub1_gpy = std(sub1_our_y)
% 
% avg_sub1_sporring = mean(sub1_sporring)
% std_sub1_sporring = std(sub1_sporring)
% 
% % avg_sub2_gpy = mean(sub2_our_y)
% % avg_sub2_sporring = mean(sub2_sporring)
% % avg_sub3_gpy = mean(sub3_our_y)
% % avg_sub3_sporring = mean(sub3_sporring)
% 
% avg_gp = mean([avg_sub1_gpy,avg_sub2_gpy,avg_sub3_gpy])
% avg_sporring = mean([avg_sub1_sporring,avg_sub2_sporring,avg_sub3_sporring])
