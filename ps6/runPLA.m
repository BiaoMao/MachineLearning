function [ww,hypothesis,iter]=runPLA(X,Y)
%PLA 

%training data
iter=0;
[T,n]=size(X);
ww = zeros(n+1, 1);
XX=[ones(T,1),X];

%always return to beginning
t=1;
while t<=T
    if (Y(t)* XX(t, :) * ww <= 0)
        iter = iter + 1;
        ww = ww + Y(t)* XX(t, :)'; 
        t=0;
    end
    t=t+1;
end

%plot result
% Xmag=max(X(:,1));
% Xmin=min(X(:,1));
% plot([Xmin Xmag],[-Xmin*ww(2)/ww(3)-ww(1)/ww(3) -Xmag*ww(2)/ww(3)-ww(1)/ww(3)],'-','LineWidth',3,'Color','k');
% xlabel('x_1','FontSize',14);
% ylabel('x_2','FontSize',14);
% legend({'h(x)=-1','h(x)=+1','final hypothesis g'},'FontSize',14);
% set(gca,'FontSize',14);

%ouotput info
hypothesis=[-ww(2)/ww(3) -ww(1)/ww(3)];