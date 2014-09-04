function m=normCol(m)
%normalize the column of the matrix and make the min as -1 and max as +1

for i=1:size(m,2)
    data=m(:,i);
    minVal=min(data);
    maxVal=max(data);
    scale=2/(maxVal-minVal);
    shift=-1/scale-minVal;
    %shift1=1/scale-maxVal;
    m(:,i)=(data+shift).*scale;
end
