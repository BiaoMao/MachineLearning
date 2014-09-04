function estimate=zspace_kNNRegion(x,y,k)
%clc;close all

FONT_SIZE=14;

%z-transfrom
z0=zTrans(x);

%estimate every x by k nearest neibo
x1min=min(x(:,1));
x1max=max(x(:,1));
x2min=min(x(:,2));
x2max=max(x(:,2));

delta=0.02; shift=1;
x1=x1min-shift:delta:x1max+shift;
x2=x2max+shift:-delta:x2min-shift;
n1=length(x1);
n2=length(x2);
estimate=zeros(n2,n1);
N=size(x,1);
index=1:N;
distance=[index' zeros(N,1)];
for i=1:n1
    for j=1:n2
        z=zTrans([x1(i),x2(j)]);
        v=z0-repmat(z,N,1);
        distance(:,1)=index';
        distance(:,2)=(v(:,1).^2+v(:,2).^2).^.5;
        distance=sortrows(distance,2);
        estimate(j,i)=sum(y(distance(1:k,1)));        
    end
end

plotMatrix(x1,x2,estimate);

title(strcat('Decision Regions with ',num2str(k),'-NN rule by z-space')...
    ,'FontSize',FONT_SIZE);

