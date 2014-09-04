function estimate=kNNRegion_digit(x,y,k,xRange)
%clc;close all

FONT_SIZE=14;
D=[y x];

%estimate every x by k nearest neibo
x1min=xRange(1);
x1max=xRange(2);
x2min=xRange(3);
x2max=xRange(4);

delta=0.01; shift=0.8;
x1=x1min-shift:delta:x1max+shift;
x2=x2max+shift:-delta:x2min-shift;
n1=size(x1,2);
n2=size(x2,2);
estimate=zeros(n2,n1);
for i=1:n1
	xcol=[repmat(x1(i),n2,1) x2'];
    estimate(:,i)=RBFCalc(xcol,D,k);   
end

plotMatrix(x1,x2,estimate);
axis(xRange)
title(strcat('Decision Regions with RBF and k=',num2str(k)),'FontSize',FONT_SIZE);

