function estimate=kNNSelf(x,y,k)
%estimate data set [x y] for itself


N=size(x,1);
estimate=zeros(N,1);
distance=[zeros(N,1)];
for i=1:N
    v=x-repmat([x(i,1),x(i,2)],N,1);
    distance(:,1)=(v(:,1).^2+v(:,2).^2).^.5;
    NNSet=zeros(k,1);
    for nn=1:k
        [~,NNSet(nn,1)]=min(distance);
        %make it very big after find previous one 
        distance(NNSet(nn,1),1)=10000;
    end
    estimate(i,:)=sign(sum(y(NNSet))); 
end
