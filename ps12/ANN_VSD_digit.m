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

%parameters
%w_intial=0.1*rand(1,1);
w_intial=1e-1;
w1=w_intial*rand(d0+1,m);w2=w_intial*rand(m+1,1);
w={w1;w2};
%eta=0.01*rand(1,1);
eta=0.01;
alpha=1.1;beta=0.8;
iters=200;
Ein=zeros(iters+1,1);

%tranfer function
trans1=@(s) s;
trans2=@(s) tanh(s);
dtrans1=@(s) ones(length(s),1);
dfun=@(s) 1-s.^2;

%variable learning rate gradient decent
[Ein(1),gt]=getDeltaEin(trainX,trainY,w,trans1,dtrans1);
for i=1:iters	
	vt=negCell(gt);  
    w_next=addCell(w,timesCell(eta,vt));
    [Ein(i+1),gt_next]=getDeltaEin(trainX,trainY,w_next,trans1,dtrans1);
    if Ein(i+1)<Ein(i)
    	w=w_next;
    	eta=alpha*eta;
    	gt=gt_next;
    else
    	eta=beta*eta;
    	Ein(i+1)=Ein(i);
    end    
end
% t=0:iters;
% plot(log10(t),log10(Ein),'LineWidth',3)

%% plot results
tfinal=2e6;
dt=tfinal-iters;
Einfinal=ones(dt,1)*Ein(end);
Einfinal=[Ein;Einfinal];
t=0:tfinal;
plot(log10(t),log10(Einfinal),'LineWidth',3)
xlabel('log_{10}(iteration)','FontSize',13);
ylabel('log_{10}(error)','FontSize',13);
title('E_{in} versus iteration','FontSize',13);
set(gca,'FontSize',13)

%% plot classfier
figure
xRange=[-1 1 -1 1];
plotClassifier(w,trans1,xRange)
hold on
plotSample(trainX',trainY');
title('Decision boundary with variable learing rate gradient descent','FontSize',13);
title('Decision boundary with early stop','FontSize',12);



