close all; clear all;
N=100; %number of samples
M = 10;   %number of bins in histograms
%%
X=rand(N,1);

[pxN,xx] = hist(X,M);
px = pxN/(N*(xx(2)-xx(1)));
display(pxN)
display(xx)
display(px)
figure
% experimental pdf
%plot(xx,p)
bar(xx,px); hold on;

%theortehical pdf
ppx = ones(size(xx)); 
plot(xx,ppx);

%%
Y=sqrt(X);

[pyN,xx] = hist(Y,M);
py = pyN/(N*(xx(2)-xx(1)));

figure
% experimental pdf
%plot(xx,p)
bar(xx,py); hold on;

%theortehical pdf
ppy = 2*xx; 
plot(xx,ppy);

%%
Y1=X.^2;

[py1N,xx] = hist(Y1,M);
py1 = py1N/(N*(xx(2)-xx(1)));
figure
%experimental pdf
% plot(xx,Y1)
bar(xx,py1); hold on;

%theoretical pdf

