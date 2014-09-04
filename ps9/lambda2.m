%----------------------------------------------------------------------
figure(2)
%linear regression lambda=2
lambda=2;
w=linearReg(Ztrain,Ytrain,lambda);

%plot the decision boundary
xTick=0.01;
x1=-1:xTick:1;
x2=-1:xTick:1;
n=length(x1);
x=zeros(n,2);
yReg=zeros(n,n);
for i=1:n
    for j=1:n
    x(j,:)=[x1(i) x2(j)];
    end
    yReg(:,i)=LegeTrans(x,q)*w;
end

%plot matrix
hold on
blue=[2/3 0 1];
red=[1 0 1];
[r,c]=find(yReg>0);
%plot(x1(r),x2(c),'.','Color',blue);
scatter(x1(r),x2(c),'MarkerEdgeColor','none','MarkerFaceColor',blue);
[r,c]=find(yReg<=0);
%plot(x1(r),x2(c),'.','Color',red);
scatter(x1(r),x2(c),'MarkerEdgeColor','none','MarkerFaceColor',red);
title('\lambda=2');

%plot features
plotFeature(Ftrain);
%----------------------------------------------------------------------------------------