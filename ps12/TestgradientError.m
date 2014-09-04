%test neural network 

clc;
%input parameter:
xInput=[1;1];
m=2;w_intial=0.25;L=2;
yOut=1;
d0=size(xInput,1);

%tranfer function
trans1=@(s) s;
trans2=@(s) tanh(s);
dtrans1=@(s) ones(length(s),1);
dtrans2=@(s) 1-s.^2;


%intial W,Ein,G
N=size(xInput,2);
w1=w_intial*ones(d0+1,m);
w2=w_intial*ones(m+1,1);
w={w1;w2};
Ein=0;G=cell(L,1);
h=zeros(N,1);

%test data
% xInput=2;
% w1=[0.1 0.2;0.3 0.4];w2=[0.2;1;-3];w3=[1;2];
% w={w1;w2;w3};G=cell(3,1);N=1;L=3;


for n=1:N
	%forward propagation to get x
	[x,h(n)]=forwardPropa(xInput(:,n),w,trans1);
   

	%backward propagation to get sensitivity delta
	delta=backwardPropa(x,w,dtrans1);

	%compute Ein
	Ein=Ein+1/4/N*((h-yOut(:,n))^2);

	%calc gradient
	for l=1:L	
        xtemp=x{l};
        xtemp=[1;xtemp];
		Gtemp=2*(h(1)-yOut(n))*(xtemp*delta{l}');   
		if (isempty(G{l}))   
			G{l}=1/N.*Gtemp/N;
		else   
			G{l}=G{l}+1/N.*Gtemp;
		end
	end
end	





