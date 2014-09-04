%LFD Problem 6.1
clc;clear;close all

load circleData
x=X;
y=Y;

%x-space 1NN and 3NN
kNNRegion(x,y,1);
hold on
plotSample(x,y)
figure
kNNRegion(x,y,3);
hold on
plotSample(x,y)





