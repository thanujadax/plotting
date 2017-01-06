function barplot_ted()

% TED errors to plot : gc,gala,stc
% RFC
fp_rfc = [0.160298, 0 ,0.013048];
fn_rfc = [0.013979, 0.073625, 0.158434];
fs_rfc = [0.191985, 0.001864, 0.050326];
fm_rfc = [0.649581, 0.712954, 0.143523];
tot_rfc = [1.015843, 0.788444, 0.365331];

fp_cnn = [0.039143, 0.00932, 0.016775];
fn_cnn = [0.015843, 0.212488, 0.089469];
fs_cnn = [0.032619, 0.007456, 0.011184];
fm_cnn = [0.245107, 0.205965, 0.108108];
tot_cnn = [0.332712, 0.435228, 0.225536];

% y = [-log(fp);
%     -log(fn);
%     -log(fs);
%     -log(fm)];
%% FM and FS for RFC
y = [fm_rfc; fs_rfc];
figure(1);
p1 = bar(y);
% legend('GC','Gala','STC')
set(gca,'XTickLabel',{'FM' 'FS'})
ylabel('Errors per segment')

x0=10;
y0=10;
width=190;
height=150;
set(gcf,'units','points','position',[x0,y0,width,height])
% axisLimits = [xmin xmax ymin ymax];
axisLimits = [0.5 2.5 0 0.8];
axis(axisLimits);
% for the legend to be saved separately uncomment the following 2 lines
% along with the legend line above
% set(p1, 'visible', 'off')
% axis off
%% FM and FS for RFC
y = [fm_cnn; fs_cnn];
figure(2);
bar(y)
legend('GC','Gala','STC')
set(gca,'XTickLabel',{'FM' 'FS'})
ylabel('Errors per segment')

x0=10;
y0=10;
width=190;
height=150;
set(gcf,'units','points','position',[x0,y0,width,height])
% axisLimits = [xmin xmax ymin ymax];
axisLimits = [0.5 2.5 0 0.25];
axis(axisLimits);
%% FP and FN for RFC
y = [fp_rfc; fn_rfc];
figure(3);
bar(y)
% legend('GC','Gala','STC')
set(gca,'XTickLabel',{'FP' 'FN'})
ylabel('Errors per segment')

x0=10;
y0=10;
width=190;
height=150;
set(gcf,'units','points','position',[x0,y0,width,height])
% axisLimits = [xmin xmax ymin ymax];
axisLimits = [0.5 2.5 0 0.20];
axis(axisLimits);
%% FM and FS for CNN
y = [fp_cnn; fn_cnn];
figure(4);
bar(y)
% legend('GC','Gala','STC')
set(gca,'XTickLabel',{'FP' 'FN'})
ylabel('Errors per segment')

x0=10;
y0=10;
width=190;
height=150;
set(gcf,'units','points','position',[x0,y0,width,height])
% axisLimits = [xmin xmax ymin ymax];
axisLimits = [0.5 2.5 0 0.25];
axis(axisLimits);
%% TED tot RFC
figure(5)
y = [tot_rfc; tot_cnn];
bar(y)
set(gca,'XTickLabel',{'TED:RFC' 'TED:CNN'})
ylabel('Errors per segment')
legend('GC','Gala','STC')

x0=10;
y0=10;
width=190;
height=150;
set(gcf,'units','points','position',[x0,y0,width,height])
% axisLimits = [xmin xmax ymin ymax];
axisLimits = [0.5 2.5 0 1.2];
axis(axisLimits);
