xcenters=(0:0.1:1);
axis([-0.05,1])

figure(1)
subplot(3,1,1)
hist(Z(:,1))
subplot(3,1,2)
hist(Z(:,2))
subplot(3,1,3)
hist(Z(:,3),xcenters)
