function res=timesCell(a,c1)

	n=size(c1);
	res=cell(n);
	for i=1:n
		res{i}=a*c1{i};
	end