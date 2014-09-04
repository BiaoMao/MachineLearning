%LFD: Q6
% This M-file constructs the individual images for 60 digits
% and plots them to a file.

%clear

format short g
% zip=load('ZipDigits.train');
% %find 1 or 5
% zip15=zip(find(zip(:,1)==1|zip(:,1)==5),:);

digits=zip15(:,1);
grayscale=zip15(:,2:end);

[n,d]=size(grayscale);
w=floor(sqrt(d));

%display 1
index1=find(digits==1);
disDigit=grayscale(index1(end),:);
curimage=reshape(disDigit,w,w);
curimage=curimage';
l=displayimage(curimage);
%sstr=['IndividualImages/image',int2str(i)];
%	eval(['print -deps ',sstr]);

figure(2)
%display 5
index5=find(digits==5);
disDigit=grayscale(index5(end),:);
curimage=reshape(disDigit,w,w);
curimage=curimage';
l1=displayimage(curimage);
%sstr=['IndividualImages/image',int2str(i)];

