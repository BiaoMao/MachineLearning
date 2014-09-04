%LFD book p109 3.1

clc;close all;clear
rng(10) 
% generate red -1
N = 1000; R1 = 10; R2 = 15;
r = unifrnd((R1/R2)^2,1,N,1);
theta = pi*rand(N,1);
x1 = R2*sqrt(r).*cos(theta);
x2= R2*sqrt(r).*sin(theta);
plot(x1,x2,'rx'); 
hold on

%generate blue +1 origin is (12.5,-5)
N = 1000; R1 = 10; R2 = 15; vector=[12.5 -5];
r = unifrnd((R1/R2)^2,1,N,1);
theta = pi*rand(N,1)-pi;
x3 = R2*sqrt(r).*cos(theta)+vector(1);
x4= R2*sqrt(r).*sin(theta)+vector(2);
plot(x3,x4,'bo'); 

%PLA sperate
X=[x1 x2;x3 x4];
Y=[-1*ones(N,1);ones(N,1)];
[w_pla,hypo_pla,iter]=runPLA(X,Y)

%regression
[w_reg,hypo_reg]=reg(X,Y)

legend({'h(x)=-1','h(x)=+1','final g by PLA','final g by regression'},'FontSize',14);




