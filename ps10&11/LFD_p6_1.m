%LFD Problem 6.1
%clc;clear;close all

%% x-space 1NN and 3NN
x=[1 0;0 1;0 -1;-1 0;0 2;0 -2;-2 0];
y=[-1 -1 -1 -1 1 1 1]';

kNNRegion(x,y,1);
hold on
plotSample(x,y)
figure
kNNRegion(x,y,3);
hold on
plotSample(x,y)

%% z-space 1NN and 3NN
figure
z=zspace_kNNRegion(x,y,1);
hold on
plotSample(x,y)

figure
z=zspace_kNNRegion(x,y,3);
hold on
plotSample(x,y)




