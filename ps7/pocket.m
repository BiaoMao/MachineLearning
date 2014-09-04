function [w,Ein,iter]=pocket(X,Y,w0)
%run the pocket algorithm

%training data
maxIter=10000;
iter=0;
[N,d]=size(X);
w = w0;
X=[ones(N,1),X];
Ein=binaryEin(X,Y,w);

%always return to beginning
i=1;
while i<=maxIter    
    k = mod(i, N) + 1;
    if (Y(k)* X(k, :) * w <= 0)            
        iter = iter + 1;
        wt= w + Y(k)* X(k, :)';   
        Et=binaryEin(X,Y,wt);
        if Et<Ein
            w=wt;
            Ein=Et;
        end
    end
    i=i+1;
end
