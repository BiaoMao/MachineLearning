function [x,h]=forwardPropa(x0,w,trans)
	%forward propagation to get x and h(x)
	L=length(w);
	x=cell(L+1,1);
    x{1,1}=x0;
	xTemp=[1;x0];
	for i=1:L
		s=w{i}'*xTemp;
		x{i+1}=trans(s);
		xTemp=[1;x{i+1}];
	end
	h=x{end};