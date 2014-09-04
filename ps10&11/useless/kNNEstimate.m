function estimate=kNNEstimate(xstar,x,y,k)
%clc;close all

%estimate xstar
N=size(x,1);
distance=[zeros(N,1)];

v=x-repmat([xstar(:,1),xstar(:,2)],N,1);
distance(:,1)=(v(:,1).^2+v(:,2).^2).^.5;
NNSet=zeros(k,1);
for nn=1:k
    [~,NNSet(nn,1)]=min(distance);
    %make it very big after find previous one 
    distance(NNSet(nn,1),1)=10000;
end
estimate=sign(sum(y(NNSet)));        


