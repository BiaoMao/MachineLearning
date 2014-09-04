%LFD E1.10
%head=1 tail=0

clc;clear;close all

%entire experiment 100000 runs
Z=zeros(100000,3);

if (matlabpool('size')==0)
    matlabpool open 4
end

parfor k=1:100000
    %toss 1000 coins per 10 times    
    X=round(rand(1000,10));
    Y=mean(X,2);
    
    %output result
    v1=Y(1);
    v_rand=Y(ceil(rand(1)*1000));
    v_min=min(Y);
    
    Z(k,:)=[v1 v_rand v_min];
end
result=mean(Z,1)
xcenters=(0:0.1:1);


figure(1)
subplot(3,1,1)
hist(Z(:,1))
xlabel('\nu_1','FontSize',14);
subplot(3,1,2)
hist(Z(:,2))
xlabel('\nu_{rand}','FontSize',14);
ylabel('Histograms of Distributions','FontSize',14);
subplot(3,1,3)
hist(Z(:,3),10)
xlabel('\nu_{min}','FontSize',14);


