function plotSample(x,y)
%plot the sample point 

MarkerSize=10;
%plot the sample points
i0=find(y==-1);
i1=find(y==1);
l=plot(x(i0,1),x(i0,2),'rx',x(i1,1),x(i1,2),'bo');
h=gca;
set(h,'FontSize',14)
set(l(2),'MarkerSize',MarkerSize);
set(l(1),'MarkerSize',MarkerSize);
set(l,'LineWidth',2)
%legend(l,'y=-1','y=+1',3);
legend(l,'Not digit 1','Digit 1',3);