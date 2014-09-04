
function [Error]=getError(xInput,yOut,w,trans,dtrans)
%input parameter:
m=10;L=2;
d0=size(xInput,1);

%intial W,Ein,G
N=size(xInput,2);
% w1=w_intial*ones(d0+1,m);
% w2=w_intial*ones(m+1,1);
% w={w1;w2};
Error=0;
h=zeros(N,1);

%test data
% xInput=2;
% w1=[0.1 0.2;0.3 0.4];w2=[0.2;1;-3];w3=[1;2];
% w={w1;w2;w3};G=cell(3,1);N=1;L=3;


for n=1:N
	%forward propagation to get x
	[x,h(n)]=forwardPropa(xInput(:,n),w,trans);

	%compute Ein
	Error=Error+1/N*((h(n)-yOut(n))^2);
end	





