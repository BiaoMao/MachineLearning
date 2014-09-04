%test SVM
clc;clear;close all
x=[1 0;-1 0];y=[1;-1];

ztrans=@(x) [x(:,1).^3-x(:,2)  x(:,1).*x(:,2)]
z=ztrans(x);

%% xspace
figure(1)
%plot region
w=[1;0];b=0;xRange=[-2 2 -2 2];
SVMRegion(w,b,xRange)
title('Decision boundary in X-space','FontSize',14)
hold on

%plot x point
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
legend(l,'x_2','x_1',3);


%% zspace
figure(2)
w=[1;0];b=0;xRange=[-2 2 -2 2];
%plot region
w=[1;0];b=0;xRange=[-2 2 -2 2];
SVMRegion_Zspace(w,b,ztrans,xRange)
title('Decision boundary in Z-space','FontSize',14)
hold on

%plot x point
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
legend(l,'x_2','x_1',3);