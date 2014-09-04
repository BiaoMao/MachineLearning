%LFD p115 3.17
syms u v k
result=solve(u==2*k,v==3*k,u^2+v^2==0.25);
k=eval(result.k)
u=eval(result.u)
v=eval(result.v)

E1=@(u,v) -2*u-3*v+3
E1optimal=E1(u(1),v(1))
