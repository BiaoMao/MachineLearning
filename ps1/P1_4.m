clear;clc;close all
%intial data
rng(10) 
%rng(40) 
%random magtitute 
mag=10;
X =mag.*rand(100, 2);
Y = (X(:, 1) > X(:, 2)) * 2 - 1;
fontsize=3;

%plot traning data D
ispos = (Y > 0);
pos = find(ispos);
neg = find(~ispos);
scatter(X(pos,1),X(pos,2),120,'o','MarkerEdgeColor','b','LineWidth', fontsize);
hold on
scatter(X(neg,1),X(neg,2),120,'x','MarkerEdgeColor','r','LineWidth', fontsize);
legend({'h(x)=+1','h(x)=-1'},'FontSize',14);
plot([0 mag],[0 mag],'LineWidth',2,'Color','k');
xlabel('x_1','FontSize',14);
ylabel('x_2','FontSize',14);
set(gca,'FontSize',14);

%training data
iter=0;
ww = zeros(3, 1);
T=size(X,1);
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
figure(2)
scatter(X(pos,1),X(pos,2),120,'o','MarkerEdgeColor','b','LineWidth', fontsize);
hold on
scatter(X(neg,1),X(neg,2),120,'x','MarkerEdgeColor','r','LineWidth', fontsize);
plot([0 mag],[0 mag],'LineWidth',3,'Color','k');
plot([0 mag],[-ww(1)/ww(3) -mag*ww(2)/ww(3)-ww(1)/ww(3)],'-.','LineWidth',3,'Color','b');
xlabel('x_1','FontSize',14);
ylabel('x_2','FontSize',14);
legend({'h(x)=+1','h(x)=-1','target function f','final hypothesis g'},'FontSize',14);
set(gca,'FontSize',14);

%ouotput info
hypothesis=[-ww(2)/ww(3) -ww(1)/ww(3)]

%always try to move
% t=1:T;
% i=2;
% while i<=20
%     if (Y(t(i)) * XX(t(i), :) * ww <= 0)
%         iter = iter + 1;
%         ww = ww + Y(t(i)) * XX(t(i), :)'; 
%         %shift the index to next step-circule
%         t=[t(2:length(t)),t(1)];
%         i=0;
%         
% %          %debug info
% %         iter
% %         ww
%     end
%     i=i+1;
% end


