%LFD HW 11.1
%clc;clear;close all
function Ecv=poly_Ecv_digit(q)
%compute Ecv using poly  polynomial transform

prepareData;

%validate data
nVal=nTrain/folder;
iVal=1:nVal:nTrain;

%% compute all the Ecv
EcvM=zeros(folder,nK);
for k=1:nK
    for i=1:folder
        %get the train and validate data
        indexVal=iVal(i):iVal(i)+nVal-1;
        valData=Ftrain(indexVal,:);
        indexTrain=[1:indexVal(1)-1 indexVal(end)+1:nTrain];
        trainData=Ftrain(indexTrain,:);
        
        estVal=kNNCalc(valData(:,2:3),trainData,k);
        EcvM(i,k)=calcError(estVal,valData(:,1));
    end
end
Ecv=mean(EcvM,1);






