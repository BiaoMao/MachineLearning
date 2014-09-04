function M=mh(N,k)
M=0;
for i=0:k-1
    M=M+nchoosek(N,i);
end
