function [z]=transform(x)
%3th polynomial transform

z=[x x.^2 x(:,1).*x(:,2)  x(:,1).^2.*x(:,2)  x(:,1).*x(:,2).^2 x.^3];
