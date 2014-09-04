function z=zTrans(x)

z(:,1)=(x(:,1).^2+x(:,2).^2).^.5;
z(:,2)=atan(x(:,2)./x(:,1));
