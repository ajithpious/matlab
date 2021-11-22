%EL4011 labs
%Mixture of 2D Gaussians 
%************************************


%% Plot 2D Gaussian pdf
%This code can be replaced with the "random" function, but the code below 
%demonstrates inner workings in 2D case.


clear all; close all; clc



%%
clear all;close all;clc
x1 = -4:0.5:4;
y1 = -4:0.5:4;
[X,Y]=meshgrid(x1,y1);
xx=[X(:),Y(:)];
%define 
m=[0,0];
a=pi/4; u1=[cos(a); sin(a)]; u2=[-u1(1);u1(2)];
U=[u1,u2]; S=[2,0;0,1];
SS=U*S*U';
y = mvnpdf(xx,m,SS);
% yy = Y;
% % yy(:)=y;
yy=reshape(y,size(Y));
% figure; contour(x1,y1,yy)
% axis equal
% figure; mesh(x1,y1,yy)
contour(yy);

%% Plot mixture of 2D Gaussian pdf
clear all; close all; clc
x1 = -4:0.1:6;
y1 = -4:0.1:6;
[X,Y]=meshgrid(x1,y1);
xx=[X(:),Y(:)];
D = 2; %number of Gaussians
a = [pi/4, pi/2];
ss = [[3.5;0.5],[2;0.2]];
mm = [[0;0],[2.5;2.5]];
ap = [0.5,0.5]
SS=zeros(2,2,D);
for kk=1:D,
    u1=[cos(a(kk)); sin(a(kk))]; u2=[-u1(2);u1(1)];
    U=[u1,u2]; S=[ss(1,kk),0;0,ss(2,kk)];
    SS(:,:,kk)=U*S*U';
end

yy=zeros(size(Y));
for kk=1:D,
    y = mvnpdf(xx,mm(:,kk)',SS(:,:,kk));
    yy(:)=yy(:)+ap(kk)*y;
end
figure; mesh(x1,y1,yy)
hh = figure; contour(x1,y1,yy)

axis equal
hold on


%% Sample from mixture of 2D Gaussian distributions

NN=700; %number of samples
t = rand(NN,1);
IND = zeros(size(t));
Y = zeros(size(t,1),2);
A=[0,cumsum(ap)];
st = ['g','r']
for kk=1:D,
    ind = find(t>A(kk)&t<=A(kk+1));
    IND(ind)= kk;
    r = mvnrnd(mm(:,kk)',SS(:,:,kk),length(ind));
    Y(ind,:) = r;
    plot(Y(ind,1),Y(ind,2),[st(kk),'+'])
end
figure; contour(x1,y1,yy) %plot samples without the knowledge of the latent variable 
axis equal
hold on
plot(Y(:,1),Y(:,2),'r+')



