%LFD: PS6 Q6 (c)
%clear
format short g

%%%%%%construct the features 

 %zip=load('ZipDi                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     gits.train');
 %zip=load('ZipDigits.train');
 zip=load('ZipDigits.test');
% %find 1 or 5
 zip15=zip(find(zip(:,1)==1|zip(:,1)==5),:);

%Ftrain=ComputeFeatures(zip15);
Ftest=ComputeFeatures(zip15);

%save ('features15.train','Ftrain', '-ascii');
save ('features15.test','Ftest', '-ascii');


%set(h,'XTick',[])
%set(h,'YTick',[])
%set(gca,'LineWidth',4,'Color','none')
%axis square
%export_fig('featuresScatter.png','-png','-transparent',gcf);
%%%%%%
