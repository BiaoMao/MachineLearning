function [Ein,Etest]=kNNPerformance(k)

clc
prepareData;

%in-sample error
estTrain=kNNCalc(Ftrain(:,2:3),Ftrain,k);
Ein=calcError(estTrain,Ftrain(:,1));

%test error
estTest=kNNCalc(Ftest(:,2:3),Ftrain,k);
Etest=calcError(estTest,Ftest(:,1));