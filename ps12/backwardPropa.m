function delta=backwardPropa(x,w,dtrans)
	%back propagation to get sensitivities

	x=x(2:end,:);
	L=length(w);
	delta=cell(L,1);

	delta{L}=dtrans(x{L});

	for	i=L-1:-1:1
		theta=dtrans(x{i});
		T= diag(theta);
        temp=w{i+1}*delta{i+1};
		delta{i}=T*(temp(2:end,:));
	end
