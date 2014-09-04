%Should run the EX1_10_coins.m first, and calculate probability

Num=size(Z,1);
P=zeros(101,3);
j=1;
mu=[0.5 0.5 0.5];
for ep=0:0.01:1
    for i=1:3
        P(j,i)=length(find((abs(Z(:,i)-mu(i)))>ep))/Num;
    end
    j=j+1;
end
ep=0:0.01:1;
figure(1)
plot(ep,P(:,1),'b-.',ep,P(:,2),'g-',ep,P(:,3),'k:','LineWidth',3);

Hoff=@(ep,N) 2*exp(-2*ep.^2*N);
hold on
plot(ep,Hoff(ep,10),'r--','LineWidth',3)

xlabel('\epsilon','FontSize',14);
ylabel('Probability','FontSize',14);
legend({'Probability curve of \nu_1','Probability curve of \nu_{rand}','Probability curve of \nu_{min}','Hoffding bound'},'FontSize',14);