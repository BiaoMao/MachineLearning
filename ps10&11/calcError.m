function error=calcError(yEst,y)
%calc binary error mismatch

N=size(y,1);
i=find(y~=yEst);
error=length(i)/N;