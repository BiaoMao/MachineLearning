function Eout=calEout(w,Ztest,ytest)
%compute Etest classification error, Eout

yReg=Ztest*w;
N=length(ytest);
n=length(find(sign(yReg)~=sign(ytest)));
Eout=n/N;




