function [Ecv,Etest]=calError(Ztrain,ytrain,Ztest,ytest,lambda)
%compute cross validation, Etest

[n,d]=size(Ztrain);
Ecv=zeros(length(lambda),1);
Etest=zeros(length(lambda),1);
for i=1:length(lambda)
    H=Ztrain*(Ztrain'*Ztrain+eye(d)*lambda(i))^-1*Ztrain';
    yRegTrain=H*ytrain;
    Wreg=(Ztrain'*Ztrain+eye(d)*lambda(i))^-1*Ztrain'*ytrain;
    yRegTest=Ztest*Wreg;
    Ecv(i,1)=mean(((yRegTrain-ytrain)./(1-diag(H))).^2);
    Etest(i,1)=mean(((yRegTest-ytest)).^2);
end


