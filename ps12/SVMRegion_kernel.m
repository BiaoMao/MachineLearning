function SVMRegion_kernel(g,xRange)
%clc;close all

x1min=xRange(1);
x1max=xRange(2);
x2min=xRange(3);
x2max=xRange(4);

delta=0.015; shift=0;
x1=x1min-shift:delta:x1max+shift;
x2=x2max+shift:-delta:x2min-shift;
n1=size(x1,2);
n2=size(x2,2);
estimate=zeros(n2,n1);
for i=1:n1	
	for j=1:n2
        estimate(j,i)=g([x1(i) x2(j)]);
    end
end

plotSVMMatrix(x1,x2,estimate);
axis(xRange)
%title(strcat('Decision Regions with RBF and k=',num2str(k)),'FontSize',FONT_SIZE);

