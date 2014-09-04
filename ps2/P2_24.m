%test the Eout  bias and variance-by Biao Mao

%target function
fx=@(x) x.^2;

%generate the D data
N=10000000;
D=zeros(N,4);
D(:,1:2)=2*rand(N,2)-1;
D(:,3:4)=fx(D(:,1:2));

%calculate
a=(D(:,3)-D(:,4))./(D(:,1)-D(:,2));
b=(D(:,1).*D(:,4)-D(:,2).*D(:,3))./(D(:,1)-D(:,2));

a_mean=mean(a);
b_mean=mean(b);

%hypothesis set
g_mean=@(x) a_mean.*x+b_mean;

%plot
x=-1:0.001:1;
plot(x,fx(x),x,g_mean(x),'LineWidth',4)

%calculate the var and bias
bias=@(x) mean((a_mean.*x+b_mean-x.^2).^2);
biasValue=bias(x)
%var=@(x) mean((a.*x+b-(a_mean.*x+b_mean)).^2);
var=@(x) mean(mean(a.^2).*x.^2+2*mean(a.*b).*x+mean(b.^2));
varValue=var(x)
Eout=@(x) mean(x.^4-2*mean(a)*x.^3+mean(a.^2-2*b)*x.^2+2*mean(a.*b).*x+mean(b.^2));
EoutVaule=Eout(x)
EoutComp=biasValue+varValue
