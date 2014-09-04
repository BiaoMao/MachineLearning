%LFD PS7 Q2
%test the Gradient Descent
function fval=findMin(f,df,x,y,eta)
close all;

steps=50;
%x=-1;y=-1;
w=[x;y];
%eta=0.1;
fvalue=zeros(steps,3);

for i=1:steps
    fvalue(i,1)=f(x,y);
    fvalue(i,2:3)=[x y];
    gt=eval(df);
    w=w+eta*(-gt);
    x=w(1);
    y=w(2);
end
plot(fvalue(:,1),'LineWidth',2);
xlabel('Iterations','FontSize',14);
ylabel('Function value','FontSize',14);
title(strcat('{\eta}=',num2str(eta)),'FontSize',14)
set(gca,'FontSize',14);

fval=fvalue(end,:);
