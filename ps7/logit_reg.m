function [w,Ein]=logit_reg(x,y)
%make the logit regression
eta=0.1;
[N,d]=size(x);
steps=500;
w=zeros(N,d);
calc_gt=@(x,y,w) -mean([y y].*x./[(1+exp(y.*sum(w.*x,2))) (1+exp(y.*sum(w.*x,2)))]);
calcEin=@(x,y,w) mean(log(1+exp(-y.*sum(w.*x,2))));
gt=calc_gt(x,y,w);
Ein=zeros(steps,1);
for i=1:steps
    Ein(i,:)=calcEin(x,y,w);
    wt1=w(1,:);
    wt2=wt1+eta*(-gt);
    w=repmat(wt2,N,1);
    gt=calc_gt(x,y,w);        
end

