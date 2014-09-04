%cmd_Ecv_digit_RBF

%% make experiments
%30 experiments and maximum k is 30
clc
expN=100;
nK=30;

EcvMar=zeros(expN,nK);

% myCluster = parcluster('local');
% delete(myCluster.Jobs);
parfor i=1:expN
    EcvMar(i,:)=RBF_Ecv_digit(1,nK);
end
Ecv_RBF=mean(EcvMar,1);

%% find minimum Ecv
[Ecv_min,k_opt]=min(Ecv_RBF);
r=2/k_opt.^.5
plot(Ecv_RBF,'-o','LineWidth',2);
xlabel('Number of centers k','FontSize',13)
ylabel('E_{cv}','FontSize',13)
set(gca,'FontSize',13)
title('E_{cv}  versus k with RBF-network');

%% save  results
save('case_Ecv_RBF');

%% peformance
clc;clear
load case_Ecv_RBF
display(k_opt)
nPeformance=1000;
Ein=zeros(nPeformance,1);
Etest=zeros(nPeformance,1);
Ecv_opt=zeros(nPeformance,1);
parfor i=1:nPeformance
    Ecv_temp=RBF_Ecv_digit(k_opt,k_opt);
    Ecv_opt(i,1)=Ecv_temp(1,k_opt);   
    [Ein(i,1),Etest(i,1)]=RBFPerformance(k_opt);
end
Ein_final=mean(Ein,1)
Etest_final=mean(Etest,1)
Ecv_opt_final=mean(Ecv_opt,1)

%% plot boundary
load case_Ecv_RBF
prepareData;
figure
xrange=[-1 1 -1 1];
RBFRegion_digit(Ftrain(:,2:3),Ftrain(:,1),k_opt,xrange);
hold on
plotSample(Ftrain(:,2:3),Ftrain(:,1))