%cmd_Ecv_digit

%% make experiments
%100 experiments and maximum k is 30
clc
nK=80;
expN=100;

EcvMar=zeros(expN,nK);

parfor i=1:expN
    EcvMar(i,:)=kNN_Ecv_digit(1,nK);
end
Ecv=mean(EcvMar,1);

%find minumn Ecv
plot(Ecv,'-o','LineWidth',2);
xlabel('k','FontSize',13)
ylabel('E_{cv}','FontSize',13)
set(gca,'FontSize',13)
title('E_{cv}  versus k with k-NN rule ');
[Ecv_min,k_opt]=min(Ecv)

%% save  results
save('case_Ecv_kNN');

%% peformance
clc;clear
load case_Ecv_kNN
display(k_opt)

nPeformance=1000;
Ein=zeros(nPeformance,1);
Etest=zeros(nPeformance,1);
Ecv_opt=zeros(nPeformance,1);
parfor i=1:nPeformance
    Ecv_temp=kNN_Ecv_digit(k_opt,k_opt);
    Ecv_opt(i,1)=Ecv_temp(1,k_opt);    
    [Ein(i,1),Etest(i,1)]=kNNPerformance(k_opt);
end
Ein_final=mean(Ein,1)
Etest__final=mean(Etest,1)
Ecv_opt_final=mean(Ecv_opt,1)


%% 
%plot boundary
close all;clc
prepareData;
figure
kNNRegion_digit(Ftrain(:,2:3),Ftrain(:,1),k_opt,[-1 1 -1 1]);
hold on
plotSample(Ftrain(:,2:3),Ftrain(:,1))