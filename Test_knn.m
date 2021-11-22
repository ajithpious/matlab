%generate new data 

close all; 
clear all;

%Two Gaussians-ones(n/2,1)
rng(7); %comment this line for a random selection of data points 
%rng(3)

n=20; %number of training points

%generation of training data
X1 = randn(n/2,2)-repmat([1.5,0],n/2,1);
X2 = randn(n/2,2)+repmat([1.5,0],n/2,1);

x=[X1;X2]; %training data in 2D
y=[-ones(n/2,1);ones(n/2,1)]; %labels for the training data
% 
% %plot the training data
figure, 
plot(X1(:,1),X1(:,2),'r+')
hold on
plot(X2(:,1),X2(:,2),'bo')
set(gca,'Xlim',[-4,4]);
set(gca,'Ylim',[-2.2,2.2]);
% 
% 
% %%
%KNN Training

%training
NumNeighbors = 3;
Mdl = fitcknn(x,y,'NumNeighbors',NumNeighbors)
% % x1 = linspace(-8,8,50);
% % y1 = x1;
% % [X,Y] = meshgrid(x1,y1);
% % TT = [X(:),Y(:)];
% % Group = [1;2];
% % Class = knnclassify(x', TT', Group);
% %[label1,prob1] = predict(Mdl, TT);
% 
% 
% %generation of the coloured plot
% XL = get(gca,'XLim');
% YL = get(gca,'YLim');
% 
% xmin = min(XL)% min(x(1,:));
% xmax = max(XL); %max(x(1,:));
% ymin = min(YL) %min(x(2,:));
% ymax = max(YL) %max(x(2,:));
% 
% 
% xx = xmin:0.05:xmax;
% yy = ymin:0.05:ymax;
% [XX,YY] = meshgrid(xx,yy);
% pp = [XX(:),YY(:)];
% [label1,P] = predict(Mdl, pp);
% 
% 
% [n,m] = size(XX);
% RGB = zeros(n,m,3);
% RGB(:) = 0;
% 
% temp =zeros(size(XX));
% temp(:) = P(:,1);
% RGB(:,:,2) = temp;
% temp(:) = P(:,2);
% RGB(:,:,1) = temp;
% 
% %coloring the perfect solution e 
% % ind1 = find(XX>0);
% % ind2 = find(XX<0);
% % temp =zeros(size(XX));
% % temp(ind1) = 1; RGB(:,:,1) = temp;
% % temp =zeros(size(XX));
% % temp(ind2) = 1; RGB(:,:,2) = temp;
% 
% figure;
% imagesc(xx,yy,RGB); axis xy; hold on
% 
% 
% %%
% % plot the data points 
% % plot(X1(:,1),X1(:,2),'k+')
% % plot(X2(:,1),X2(:,2),'k*')
% 
% %%
% %generate validation data
% rng(5)
% N = 20; %number of test points
% 
% X1 = randn(N/2,2)-repmat([1.5,0],N/2,1);
% X2 = randn(N/2,2)+repmat([1.5,0],N/2,1);
% 
% plot(X1(:,1),X1(:,2),'k+'); hold on;
% plot(X2(:,1),X2(:,2),'k*')
% 
% %compute the trained knn output 
% [X1label,P] = predict(Mdl, X1);
% [X2label,P] = predict(Mdl, X2);
% 
% %identify FN& FP
% indFN = find(X2label==-1); %find FN
% indFP = find(X1label==1); %find FP
% 
% %plot the results
% plot(X2(indFN,1),X2(indFN,2),'ko')
% plot(X1(indFP,1),X1(indFP,2),'ko')
% 
% axis equal
% set(gca,'Xlim',[-4,4]);
% set(gca,'Ylim',[-2.2,2.2]);
% %%
% %plot the contours of the Gaussian distribution the data point were drawn
% 
% % % Plot mixture of 2D Gaussian pdf
% % % clear all; close all; clc
% % x1 = -4:0.1:4;
% % y1 = -2.2:0.1:2.2;
% % % [X,Y]=meshgrid(x1,y1);
% % xx=[X(:),Y(:)];
% 
% D = 2; %number of Gaussians
% prob=zeros(size(XX));
% mm = [[-1.5;0],[1.5;0]];
% SS = eye(2);
% ap = [0.5,0.5]
% 
% for kk=1:D,
%     probT = mvnpdf(pp,mm(:,kk)',SS);
%     prob(:)=prob(:)+ap(kk)*probT;
% end
% 
% %mesh(x1,y1,yy)
% contour(xx,yy,prob)
% 
% axis equal
% set(gca,'Xlim',[-4,4]);
% set(gca,'Ylim',[-2.2,2.2]);
% 
% % hold on







