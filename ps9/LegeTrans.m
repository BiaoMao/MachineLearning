function z=LegeTrans(x,q)
%qth Legendre transform

d=(q+2)*(q+1)/2;
n=length(x);
z=zeros(n,d);
k=1;
for i=0:q
    for j=0:q-i
    z(:,k)=getLeg(x(:,1),i).*getLeg(x(:,2),j);
    k=k+1;
    end
end