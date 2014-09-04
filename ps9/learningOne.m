%LFD hw9:1-3
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

%linear regression lambda=2
lambda=2;
w=linearReg(Ztrain,Ytrain,lambda);

%Ein classification error
Ein=calEout(w,Ztrain,Ytrain)


%plot the decision boundary
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

    



