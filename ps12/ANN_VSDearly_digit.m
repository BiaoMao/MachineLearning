%neural network for digits using gradient descent

clc;clear
rng('shuffle');

%generate data
[trainData,testData]=prepareData();

%transfer the data to the deltaEin function
trainX=trainData(:,2:3)';trainY=trainData(:,1)';
testX=testData(:,2:3)';testY=testData(:,1)';
totalX=[trainX testX];totalY=[trainY testY];
d0=2;m=10;

%% make validate data
validaX=trainX(:,1:50);validaY=trainY(:,1:50);
trainX=trainX(:,51:300);trainY=trainY(:,51:300);

%parameters
%w_intial=0.1*rand(1,1);
w_intial=0.1;
w1=w_intial*rand(d0+1,m);w2=w_intial*rand(m+1,1);
w={w1;w2};
%eta=0.01*rand(1,1);rand
eta=0.01;
alpha=1.1;beta=0.8;
iters=800;
Ein=zeros(iters+1,1);
Eval=zeros(iters+1,1);
wMatrix=cell(iters+1,1);

%tranfer function
trans1=@(s) s;
trans2=@(s) tanh(s);
dtrans1=@(s) ones(length(s),1);
dfun=@(s) 1-s.^2;

%variable learning rate gradient decent
[Ein(1),gt]=getDeltaEin(trainX,trainY,w,trans1,dtrans1);
[Eval(1)]=getError(validaX,validaY,w,trans1,dtrans1);
wMatrix{1}=w;
for i=1:iters	
	vt=negCell(gt);  
    w_next=addCell(w,timesCell(eta,vt));
    [Ein(i+1),gt_next]=getDeltaEin(trainX,trainY,w_next,trans1,dtrans1);
    if Ein(i+1)<Ein(i)
    	w=w_next;
    	eta=alpha*eta;
    	gt=gt_next;
        [Eval(i+1)]=getError(testX,testY,w,trans1,dtrans1);        
    else
    	eta=beta*eta;
    	Ein(i+1)=Ein(i);
        Eval(i+1)=Eval(i);
    end      
    wMatrix{i+1}=w;
end
% t=0:iters;
% plot(log10(t),log10(Ein),log10(t),log10(Eval))
% legend('Ein','Eval');

%% plot classfier
figure
[minEval,index]=min(Eval);
w=wMatrix{index};
xRange=[-1 1 -1 1];
plotClassifier(w,trans1,xRange)
hold on
plotSample(trainX',trainY');
title('Decision boundary with early stop','FontSize',12);



