function w=linearReg(z,y,lambda)
%witght decay linear regression

d=size(z,2);
w=(z'*z+eye(d)*lambda)^-1*z'*y;
