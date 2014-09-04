%LFD PS7 Classifying Handwritten Digits: 1 vs. 5 with transform
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
Z=transform(X);
[w,hypo]=reg(Z,Y)
[w,Ein,iter]=pocket(Z,Y,w)
X1mag=max(X(:,1));
X1min=min(X(:,1));
X2mag=max(X(:,2));
X2min=min(X(:,2));
x1=X1min:0.005:X1mag;
x2=X2min:0.1:X2mag;
x2=fliplr(x2);
y_est=zeros(length(x2),length(x1));
for i=1:length(x1)
    for j=1:length(x2)
        z1=transform([x1(i) x2(j)]);
        z1=[1 z1];
        y_est(j,i)=sign(z1*w);
        if j>1
            if y_est(j,i)==-1 &&  y_est(j-1,i)==1
                plot(x1(i),(x2(j)+x2(j-1))/2,'-d','LineWidth',3,'Color','k');
            end
        end
    end
end
title('Training data using 3rd order polynomial model','FontSize',14);
 
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

Xtest=features15(:,2:3);
Ytest=features15(:,1);
for i=1:length(x1)
    for j=1:length(x2)     
        if j>1
            if y_est(j,i)==-1 &&  y_est(j-1,i)==1
                plot(x1(i),(x2(j)+x2(j-1))/2,'-d','LineWidth',3,'Color','k');
            end
        end
    end
end
title('Test data using 3rd order polynomial model','FontSize',14);

Ztest=transform(Xtest);
Ztest=[ones(length(Ztest),1) Ztest];
Etest=binaryEin(Ztest,Ytest,w)

% 
% [N,d]=size(X);
% delta=0.05;
% Eout1=Ein+(8/N*log((4*(2*N)^d+1)/delta))^.5
% Eout2=Etest+(log(2/delta)/2/N)^.5

% x1=Ftrain(:,2);
% x2=Ftrain(:,3);
% wt=w(1,:);
% xmin=min(x1);
% xmax=max(x1);
% plot([xmin xmax],[-xmin*w(1)/w(2) -xmax*w(1)/w(2)],'LineWidth',2);

