%LFD PS7 Classifying Handwritten Digits: 1 vs. 5
close all;
%prepare the data
features15=load('features15.train');
index5=find(features15==5);
features15(index5,1)=-1;

figure(1)

%%%%%%make a scatter-plot of the features
Ftrain=features15;
j0=find(Ftrain(:,1)==-1);
j1=find(Ftrain(:,1)==1);
l=plot(Ftrain(j0,2),Ftrain(j0,3),'rx',Ftrain(j1,2),Ftrain(j1,3),'bo');
h=gca;
set(h,'FontSize',14)
set(l(2),'MarkerSize',12);
set(l(1),'MarkerSize',12);
set(l,'LineWidth',2)
leg=legend(l,'Digit 5','Digit 1',3);
set(leg,'LineWidth',2,'FontSize',14);
xh=xlabel('Intensity');set(xh,'FontSize',14);
yh=ylabel('Symmetry');set(yh,'FontSize',14);
axis([0 0.7 -8 0.1]);
hold on

%logit_regress
%[w,Ein]=logit_reg(features15(:,2:3),features15(:,1));

%linear regress
X=features15(:,2:3);
Y=features15(:,1);
[w,hypo]=reg(X,Y)
[w,Ein,iter]=pocket(X,Y,w)
Xmag=max(X(:,1));
Xmin=min(X(:,1));
plot([Xmin Xmag],[-Xmin*w(2)/w(3)-w(1)/w(3)...
     -Xmag*w(2)/w(3)-w(1)/w(3)],'-','LineWidth',3,'Color','k');
 title('Training Data','FontSize',14);
 
 %for test data
 %prepare the data
features15=load('features15.test');
index5=find(features15==5);
features15(index5,1)=-1;
figure(2)

%%%%%%make a scatter-plot of the features
Ftest=features15;
j0=find(Ftest(:,1)==-1);
j1=find(Ftest(:,1)==1);
l=plot(Ftest(j0,2),Ftest(j0,3),'rx',Ftest(j1,2),Ftest(j1,3),'bo');
h=gca;
set(h,'FontSize',14)
set(l(2),'MarkerSize',12);
set(l(1),'MarkerSize',12);
set(l,'LineWidth',2)
leg=legend(l,'Digit 5','Digit 1',3);
set(leg,'LineWidth',2,'FontSize',14);
xh=xlabel('Intensity');set(xh,'FontSize',14);
yh=ylabel('Symmetry');set(yh,'FontSize',14);
axis([0 0.7 -8 0.1]);
hold on

X=[ones(length(features15),1) features15(:,2:3)];
Y=features15(:,1);
Xmag=max(X(:,2));
Xmin=min(X(:,2));
Etest=binaryEin(X,Y,w);
plot([Xmin Xmag],[-Xmin*w(2)/w(3)-w(1)/w(3)...
     -Xmag*w(2)/w(3)-w(1)/w(3)],'-','LineWidth',3,'Color','k');
title('Test Data','FontSize',14);

[N,d]=size(X);
delta=0.05;
Eout1=Ein+(8/N*log((4*(2*N)^d+1)/delta))^.5
Eout2=Etest+(log(2/delta)/2/N)^.5

% x1=Ftrain(:,2);
% x2=Ftrain(:,3);
% wt=w(1,:);
% xmin=min(x1);
% xmax=max(x1);
% plot([xmin xmax],[-xmin*w(1)/w(2) -xmax*w(1)/w(2)],'LineWidth',2);

