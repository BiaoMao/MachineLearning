function plotSVMMatrix(x1,x2,yReg)

%plot matrix

blue=[135 206 235]/255;
red=[255 192 203]/255;
[r,c]=find(yReg>=0);
%plot(x1(r),x2(c),'.','Color',blue);

%figure out what's axis how to plot matrix!!!!-----------------------------------------------
scatter(x1(c),x2(r),'MarkerEdgeColor','none','MarkerFaceColor',blue);
hold on
[r,c]=find(yReg<=0);
%plot(x1(r),x2(c),'.','Color',red);
scatter(x1(c),x2(r),'MarkerEdgeColor','none','MarkerFaceColor',red);

% [r,c]=find(abs(yReg)<1);
% %plot(x1(r),x2(c),'.','Color',red);
% scatter(x1(c),x2(r),'MarkerEdgeColor','none','MarkerFaceColor','k','LineWidth',0.75);

