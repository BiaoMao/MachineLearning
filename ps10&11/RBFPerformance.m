function [Ein,Etest]=RBFPerformance(k)

clc
prepareData;

%in-sample error
estTrain=RBFCalc(Ftrain(:,2:3),Ftrain,k);
Ein=calcError(estTrain,Ftrain(:,1));

%test error
estTest=RBFCalc(Ftest(:,2:3),Ftrain,k);
Etest=calcError(estTest,Ftest(:,1));