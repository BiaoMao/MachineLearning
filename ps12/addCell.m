function res=addCell(c1,c2)

	n=size(c1);
	res=cell(n);
	for i=1:n
		res{i}=c1{i}+c2{i};
	end