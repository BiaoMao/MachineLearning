%LFD p109 3.2
%test different sep
clc;clear;close all
sep=[0.2:0.2:5];
iters=zeros(length(sep),1);

for i=1:length(sep)
    %rng(10) 
    % generate red -1
    N = 1000; R1 = 10; R2 = 15;
    r = unifrnd((R1/R2)^2,1,N,1);
    theta = pi*rand(N,1);
    x1 = R2*sqrt(r).*cos(theta);
    x2= R2*sqrt(r).*sin(theta);
    hold on

    %generate blue +1 origin is (12.5,-5)
    r = unifrnd((R1/R2)^2,1,N,1);
    theta = pi*rand(N,1)-pi;
    vector=[12.5 -sep(i)];
    x3 = R2*sqrt(r).*cos(theta)+vector(1);
    x4= R2*sqrt(r).*sin(theta)+vector(2);
    
    %PLA sperate
    X=[x1 x2;x3 x4];
    Y=[-1*ones(N,1);ones(N,1)];
    [w_pla,hypo_pla,iters(i)]=runPLA(X,Y);
end

plot(sep,iters,'LineWidth',3)
set(gca,'FontSize',14)
xlabel('sep','FontSize',14)
ylabel('Number of iterations','FontSize',14);