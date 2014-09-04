function [w_reg,hypo_reg]=reg(X,Y)
%regression
X=[ones(length(X),1) X];
w_reg=(X'*X)^-1*X'*Y;
hypo_reg=[-w_reg(2)/w_reg(3) -w_reg(1)/w_reg(3)];

%plot result
Xmag=max(X(:,2));
Xmin=min(X(:,2));
plot([Xmin Xmag],[-Xmin*w_reg(2)/w_reg(3)-w_reg(1)/w_reg(3)...
    -Xmag*w_reg(2)/w_reg(3)-w_reg(1)/w_reg(3)],'-.','LineWidth',3,'Color','b');
xlabel('x_1','FontSize',14);
ylabel('x_2','FontSize',14);
set(gca,'FontSize',14);