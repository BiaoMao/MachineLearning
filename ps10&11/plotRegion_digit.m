%% plot the final region
close all

figure
kNNRegion_digit(sx,sy,3,[-1 1 -1 1]);
hold on
plotSample(sx,sy)
title(strcat('Decision Regions with ',num2str(k)...
    ,'-NN and condensed data'),'FontSize',FONT_SIZE);

figure
kNNRegion_digit(Ftrain(:,2:3),Ftrain(:,1),3,[-1 1 -1 1]);
hold on
plotSample(Ftrain(:,2:3),Ftrain(:,1))
title(strcat('Decision Regions with ',num2str(k)...
    ,'-NN and all the data'),'FontSize',FONT_SIZE);

%% plot all the experiments
figure
MarkerSize=5;
FONT_SIZE=12;
n=size(Eout_condensed,1);
l=plot(1:n,Eout_original,'ro',1:n,Eout_condensed,'bo');
h=gca;
set(h,'FontSize',FONT_SIZE)
set(l(2),'MarkerSize',MarkerSize);
set(l(1),'MarkerSize',MarkerSize);
set(l,'LineWidth',2)
legend(l,'E_{out} with all data','E_{out} with condensed data',3);
xlabel('The i^{th} random training-testing splits','FontSize',FONT_SIZE);
ylabel('Out-of-sample performance','FontSize',FONT_SIZE);
title('Out-of-sample performance with condensed data and all data','FontSize',FONT_SIZE);