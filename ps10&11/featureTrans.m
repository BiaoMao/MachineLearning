function z=featureTrans(x,centers,r,k)
%% compute the feature matrix

[N,d]=size(x);
%gaussian kernel
gaussian=@(z) exp(-.5.*z.^2);
%Euc distance
distance=@(x) (x(:,1).^2+x(:,2).^2).^.5;

z=zeros(N,k+1);
for i=1:N
    z(i,1)=1;
    dis=gaussian(distance([x(i,1)-centers(:,1) x(i,2)-centers(:,2)])./r);
    z(i,2:end)=dis';
end