%LFD hw9:4-8
%End to End Learning with Regularization and Validation
function Etest=order8_digit(lambda)
clc;close all
Fall=load('features.all');


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

%linear regression optimal lambda*
w=linearReg(Ztrain,Ytrain,lambda);

%Etest classification error
Etest=calEout(w,Ztest,Ytest);
%EcvOpt=Ecv(iOpt)
%EtestOpt=Etest(iOpt)
