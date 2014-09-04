function regular=getRegular(w)

L=length(w);
regular=0;
for i=1:L
    regular=sum(sum(w{i}.^2));
end