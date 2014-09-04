
function [Ein,G]=getDeltaEin(xInput,yOut,w,trans,dtrans)
%input parameter:
m=10;L=2;
d0=size(xInput,1);

%intial W,Ein,G
N=size(xInput,2);
% w1=w_intial*ones(d0+1,m);
% w2=w_intial*ones(m+1,1);
% w={w1;w2};
Ein=0;G=cell(L,1);
h=zeros(N,1);

%test data
% xInput=2;
% w1=[0.1 0.2;0.3 0.4];w2=[0.2;1;-3];w3=[1;2];
% w={w1;w2;w3};G=cell(3,1);N=1;L=3;


for n=1:N
	%forward propagation to get x
	[x,h(n)]=forwardPropa(xInput(:,n),w,trans);
   

	%backward propagation to get sensitivity delta
	delta=backwardPropa(x,w,dtrans);

	%compute Ein
	Ein=Ein+1/N/4*((h(n)-yOut(n))^2);

	%calc gradient
	for l=1:L	
        xtemp=x{l};
        xtemp=[1;xtemp];
		Gtemp=2*(h(n)-yOut(n))*(xtemp*delta{l}');   
		if (isempty(G{l}))   
			G{l}=1/N.*Gtemp;
		else   
			G{l}=G{l}+1/N.*Gtemp;
		end
	end
end	





