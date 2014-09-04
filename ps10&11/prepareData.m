
%% prepare data
%para
folder=10;
nTrain=300;
rng('shuffle');

%get data
Fall=load('features.all');
Fall(:,2:3)=normCol(Fall(:,2:3));

nData=size(Fall,1);
index=find(Fall(:,1)==1);
Fall(:,1)=-1*ones(nData,1);
Fall(index,1)=1;

%select train data
indexTrain=randperm(nData);
indexTrain=indexTrain((1:nTrain));
Ftrain=Fall(indexTrain,:);
Ftest=Fall;
Ftest(indexTrain,:)=[];
nTest=size(Ftest,1);