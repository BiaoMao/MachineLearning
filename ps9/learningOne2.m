%LFD hw9:4-8
%End to End Learning with Regularization and Validation

clear;clc;close all
Fall=load('features.all');
FONT_SIZE=13;

%Normalize feature
Fall(:,2:3)=normCol(Fall(:,2:3));

%select train data
nTrain=300;
nData=length(Fall);
indexTrain=randperm(nData);
indexTrain=indexTrain((1:nTrain));
Ftrain=Fall(indexTrain,:);
Ftest=Fall;
Ftest(indexTrain,:)=[];
nTest=length(Ftest);

%8th Legendre Poly transformer
q=8;
Ztrain=LegeTrans(Ftrain(:,2:3),q);
index=find(Ftrain(:,1)==1);
Ytrain=-1*ones(nTrain,1);
Ytrain(index,1)=1;
%test data
Ztest=LegeTrans(Ftest(:,2:3),q);
index=find(Ftest(:,1)==1);
Ytest=-1*ones(nTest,1);
Ytest(index,1)=1;

%cal Ecv,Etest
lambdaVec=0:0.01:2;
[Ecv,Etest]=calError(Ztrain,Ytrain,Ztest,Ytest,lambdaVec);
plot(lambdaVec',Ecv,'r',lambdaVec',Etest,'b','LineWidth',2);
legend({'E_{cv}','E_{test}'},'FontSize',FONT_SIZE);
axisLim=[min(lambdaVec) max(lambdaVec) min(Ecv)-0.01 3*min(Ecv)];
axis(axisLim);
title('E_{cv} and E_{test} for different \lambda','FontSize',FONT_SIZE);
xlabel('Regularization parameter \lambda','FontSize',FONT_SIZE);

%use the min Ecv and optimal lambda*
iOpt=find(Ecv==min(Ecv),1);
lambda=lambdaVec(iOpt);

%linear regression optimal lambda*
w=linearReg(Ztrain,Ytrain,lambda);

%Etest classification error
Eout=calEout(w,Ztest,Ytest)
EcvOpt=Ecv(iOpt)
EtestOpt=Etest(iOpt)

%plot the decision boundary
figure(2)
xTick=0.01;
x1=-1:xTick:1;
x2=1:-xTick:-1;
n=length(x1);
x=zeros(n,2);
yReg=zeros(n,n);
for i=1:n
    for j=1:n
    x(j,:)=[x1(i) x2(j)];
    end
    yReg(:,i)=LegeTrans(x,q)*w;
end

%plot matrix
hold on
blue=[135 206 235]/255;
red=[255 192 203]/255;
[r,c]=find(yReg>0);
%plot(x1(r),x2(c),'.','Color',blue);

%figure out what's axis how to plot matrix!!!!-----------------------------------------------
scatter(x1(c),x2(r),'MarkerEdgeColor','none','MarkerFaceColor',blue);
[r,c]=find(yReg<=0);
%plot(x1(r),x2(c),'.','Color',red);
scatter(x1(c),x2(r),'MarkerEdgeColor','none','MarkerFaceColor',red);
title(strcat('Decision boundary when \lambda=',num2str(lambda)),'FontSize',FONT_SIZE);

%plot features
plotFeature(Ftrain);