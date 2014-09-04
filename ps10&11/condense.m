function [sx,sy]=condense(x,y,k)
%condense data set D to S
%just calculate the estimate by itself
Dy=kNNCalc(x,x,y,k);

N=length(x);
s=randperm(N);
s=(s(1:k))';
state=zeros(N,1);
sx=x(s,:);
sy=y(s,:);

i=1;
while(i<=N)
    yEst=kNNCalc(x(i,:),sx,sy,k);
    if(yEst==Dy(i,:))
        state(i,1)=1;
        i=i+1;
    else
        near=findNearRight(i,s,x,y,Dy);
        if(~isempty(near))
            s(end+1,:)=near;
            sx(end+1,:)=x(near,:);
            sy(end+1,:)=y(near,:);
            state=zeros(N,1);
            i=1;
        else
            display('Nearest not found');
            i=i+1;
        end
    end
end


