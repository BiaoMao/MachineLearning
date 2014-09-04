p=0.51;
Prob=0;
for k=0:12
    Prob=Prob+nchoosek(25,25-k)*p^(25-k)*(1-p)^k;
end
Prob