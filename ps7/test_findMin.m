%LFD PS7 Q2b

eta=[0.01 0.1];
startP=[0.1 0.1;1 1;-0.5 -0.5;-1 -1];
len_eta=length(eta);
len_start=size(startP,1);
len=len_eta*len_start;
results=zeros(len,6);

%initial function
syms x y
f=@(x,y) x.^2+2*y.^2+2*sin(2*pi*x)*sin(2*pi*y);
df=gradient(f,[x y]);


for i=1:len_eta
    for j=1:len_start        
    results(j+4*(i-1),:)=[eta(i) startP(j,:) findMin(f,df,startP(j,1),startP(j,2),eta(i))];
    end
end