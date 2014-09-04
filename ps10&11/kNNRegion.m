function estimate=kNNRegion(x,y,k)
%clc;close all

FONT_SIZE=14;

%estimate every x by k nearest neibo
x1min=min(x(:,1));
x1max=max(x(:,1));
x2min=min(x(:,2));
x2max=max(x(:,2));

delta=0.02; shift=1;
x1=x1min-shift:delta:x1max+shift;
x2=x2max+shift:-delta:x2min-shift;
n1=size(x1,2);
n2=size(x2,2);
estimate=zeros(n2,n1);
N=size(x,1);
distance=[zeros(N,1)];
for i=1:n1
    for j=1:n2
        v=x-repmat([x1(i),x2(j)],N,1);
        distance(:,1)=(v(:,1).^2+v(:,2).^2).^.5;
        NNSet=zeros(k,1);
        for nn=1:k
            [~,NNSet(nn,1)]=min(distance);
            %make it very big after find previous one 
            distance(NNSet(nn,1),1)=10000;
        end
        estimate(j,i)=sign(sum(y(NNSet)));        
    end
end

plotMatrix(x1,x2,estimate);
%axis([x1min x1max x2min x2max])
axis([x1min-shift x1max+shift x2min-shift x2max+shift])
title(strcat('Decision Regions with ',num2str(k),'-NN rule'),'FontSize',FONT_SIZE);

