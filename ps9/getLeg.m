function L=getLeg(x,k)
%get Legendre Polynomials by recursive

if k==0 
    L=1;
    return;
end

if k==1 
    L=x;
    return;
end

L=(2*k-1)/k.*x.*getLeg(x,k-1)-(k-1)/k.*getLeg(x,k-2);



