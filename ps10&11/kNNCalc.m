function estimate=kNNCalc(x,D,k)
%estimate data set [x y] for test data
%the first column in D is y, and the other two is x
Dx=D(:,2:3);
Dy=D(:,1);

Nx=size(x,1);
Nd=size(Dx,1);
estimate=zeros(Nx,1);
distance=[zeros(Nd,1)];
v=zeros(Nd,2);
for i=1:Nx    
    v(:,1)=Dx(:,1)-x(i,1);
    v(:,2)=Dx(:,2)-x(i,2);
    %v=Dx-repmat([x(i,1),x(i,2)],Nd,1);
    distance(:,1)=(v(:,1).^2+v(:,2).^2).^.5;
    %avoid the distance of itself 
    %ide=find(distance==0);
    %distance(ide,:)=10000;
    NNSet=zeros(k,1);
    for nn=1:k
        [~,NNSet(nn,1)]=min(distance);
        %make it very big after find previous one 
        distance(NNSet(nn,1),1)=10000;
    end
    estimate(i,:)=sign(sum(Dy(NNSet))); 
end
