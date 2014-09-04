function vt=negCell(gt)
	%get a negative of a cell data
	n=size(gt);
	vt=cell(n);
	for i=1:n
		vt{i}=-gt{i};
	end
