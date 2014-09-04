%LFD Problem 6.16
%clc;clear;close all
function [Eout_con,Eout_ori]=LFD_p6_16_digit()

%para
k=3;

%get data
Fall=load('features.all');
%Fall(:,2:3)=normCol(Fall(:,2:3));

nData=size(Fall,1);
index=find(Fall(:,1)==1);
Fall(:,1)=-1*ones(nData,1);
Fall(index,1)=1;

%select train data
nTrain=500;
indexTrain=randperm(nData);
indexTrain=indexTrain((1:nTrain));
Ftrain=Fall(indexTrain,:);
Ftest=Fall;
Ftest(indexTrain,:)=[];
nTest=size(Ftest,1);

%Normalize feature
%Ftrain(:,2:3)=normCol(Ftrain(:,2:3));
%Ftest(:,2:3)=normCol(Ftest(:,2:3));

%condense data
[sx,sy]=condense(Ftrain(:,2:3),Ftrain(:,1),k);

%test data with condense
estTest=kNNCalc(Ftest(:,2:3),[sy sx],k);
Eout_con=calcError(estTest,Ftest(:,1));

%test data with ori data
estTest=kNNCalc(Ftest(:,2:3),Ftrain,k);
Eout_ori=calcError(estTest,Ftest(:,1));

%plot boundary
% figure
% kNNRegion(sx,sy,3);
% hold on
% plotSample(sx,sy)





