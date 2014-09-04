

nSample=@(N) N-8/0.05^2*log(4/0.05*((2*N)^10)+1);
N=fsolve(nSample,100000)
nSample( N)