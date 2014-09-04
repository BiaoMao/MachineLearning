function  estY=RBFCalc(x,D,k)
%compute estimated Y based on RBF method
%each row is one data point

Dx=D(:,2:3);
Dy=D(:,1);

r=2/k^.5;
try
    [~,centers]=kmeans(Dx,k,'emptyaction','singleton');
catch err
    input('kmean error accur!')    
end

Dz=featureTrans(Dx,centers,r,k);

%no regulartion
lambda=0;
w=linearReg(Dz,Dy,lambda);

%output estimate
estZ=featureTrans(x,centers,r,k);
estY=sign(estZ*w);






