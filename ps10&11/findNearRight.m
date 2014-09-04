function index=findNearRight(istar,s,x,y,Dy)
%find nearest neighbor with the right classficiation
N=size(x,1);
target=(1:N)';
target(s,:)=[];
%this point should have the same original value as Dy
target=target(find(y(target,:)==Dy(istar,:)));
xtarget=x(target,:);

v=xtarget-repmat([x(istar,1),x(istar,2)],size(xtarget,1),1);
distance(:,1)=(v(:,1).^2+v(:,2).^2).^.5;
[~,i]=min(distance);   
index=target(i);
if(isempty(index)) 
    input('not found');
end

