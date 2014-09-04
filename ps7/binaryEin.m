function Ein=binaryEin(x,y,w)
%compute the Binary classification error

[N,d]=size(x);
%x=[ones(N,1) x];
w=repmat(w',N,1);

Ein=length(find(sign(sum(w.*x,2))~=y))/N;

