clear;clc;close all
V=zeros(100000,2);
N=6;

if (matlabpool('size')==0)
    matlabpool open 4
end

%toss coins
parfor k=1:100000
   V(k,:)=[mean(round(rand(N,1))) mean(round(rand(N,1)))];   
end

%calculate probability
P=zeros(101,1);
j=1;
for ep=0:0.01:1
    P(j)=length(find((abs(V(:,1)-0.5)>ep|abs(V(:,2)-0.5)>ep)))/size(V,1);
    j=j+1;
end
ep=0:0.01:1;
figure
plot(ep,P,'b-','LineWidth',3)
hold on

Hoff=@(ep,N) 4*exp(-2*N*ep.^2)
plot(ep,Hoff(ep,N),'r--','LineWidth',3)

xlabel('\epsilon','FontSize',14);
ylabel('Probability','FontSize',14);
legend({'Probability curve','Hoffding bound'},'FontSize',14);



