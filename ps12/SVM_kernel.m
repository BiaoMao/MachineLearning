clc;clear
%rng('shuffle');

%generate data
[trainData,testData]=prepareData();
trainX=trainData(:,2:3);trainY=trainData(:,1);
testX=testData(:,2:3);testY=testData(:,1);
totalX=[trainX;testX];totalY=[trainY;testY];
nTrain=size(trainX,1);

%kernel
kernel=@(xn,xm) (1+xn*xm').^8;

%computer G:
G=trainY*trainY'.*kernel(trainX,trainX);

%  solve QP
%c=0.1:0.1:1;
c=[5];
testError=zeros(length(c),1);
gx=cell(length(c),1);
for i=1:length(c)
    C=c(i)*ones(nTrain,1);
    H=G;f=-ones(nTrain,1);Aeq=trainY';beq=0;lb=zeros(nTrain,1);ub=C;
    alpha=quadprog(H,f,[],[],Aeq,beq,lb,ub);

    %final hypo
    s=find(alpha>0);
    s1=s(1);
    b=trainY(s1,:)-sum(alpha(s).*trainY(s,:).*kernel(trainX(s,:),trainX(s1,:)));
    gx=@(x) sign(sum(alpha(s).*trainY(s,:).*kernel(trainX(s,:),x))+b);   
    
    
    %test error    
    estTest=zeros(length(testY),1);
    for j=1:length(testY)
        estTest(j)=gx(testX(j,:));        
    end
    testError(i)=length(find(estTest~=testY))/length(testY);
end

% plot decision boundary

[Etestmin,index]=min(testError);
C=c(index);
xRange=[-1 1 -1 1];
SVMRegion_kernel(gx,xRange);
hold on
plotSample(trainX,trainY);
title(strcat('Decision boundary by SVM when C=',num2str(C)),'FontSize',13)


