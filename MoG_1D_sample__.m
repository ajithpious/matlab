%EL4011 labs
%Mixture of Gaussians 
%************************************
%% Plot 1D Gaussian pdf and sample from it

%this code can be replaced with the "random" function, but the code below 
%demonstrates inner workings in 1D case.

clear all; close all; clc

%%
figure
dd=1.5
d=0.1;
N=40; %number of drawn samples, try a small number e.g. N=40 and a very
      %large number e.g. N=100000 and compare the diffrence
x = -5:d:5;
y=normpdf(x,0,dd);

plot(x,y,'r-','Linewidth',3), hold on
xx=randn(N,1);
xx
stem(xx,0.1*ones(length(xx),1))

figure
plot(x,y,'r-','Linewidth',3), hold on
yy = hist(xx,x);
bar(x,yy/(N*d))

%% Plot mixture of 1D Gaussian distribution pdf
%clear all; close all; clc
N=2;     %number of Gaussians
m=[0,3]; %means
s=[1,1]; %std
a=[0.3,0.7];  %mixing coefficients
d=0.1;
x=-4:d:7;
p=0;

for kk=1:N,
    p=p+a(kk)*normpdf(x,m(kk),s(kk));
end

figure, plot(x,p,'r-'); hold on


%% Sample from 1D mixture Gaussian distributions 
NN=100000;        %number of samples
t = rand(NN,1);
IND = zeros(size(t));
Y = zeros(size(t));
A=[0,cumsum(a)];
for kk=1:2,
    ind = find(t>A(kk)&t<=A(kk+1));
%     IND(ind)= kk;  %random selection from which Gaussain to sample
    Y(ind) = s(kk)*randn(length(ind),1)+m(kk);  %sample from the selected Gaussuian    
end
yy = hist(Y,x);
bar(x,yy/(NN*d))
plot(x,p,'c-')
 




