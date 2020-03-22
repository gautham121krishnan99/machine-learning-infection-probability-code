function [theta] = training(X,y,initial_theta,lambda)
%TRAINLINEARREG Trains linear regression given a dataset (X, y) and a
%regularization parameter lambda
%   [theta] = TRAINLINEARREG (X, y, lambda) trains linear regression using
%   the dataset (X, y) and regularization parameter lambda. Returns the
%   trained parameters theta.
%
alpha=500;
m=size(X,1);
n=size(X',1);
X=[ones(m,1),X];
j=zeros(2500,1);
for i=1:2500
[J,grad_theta]=lrCostFunction(initial_theta,X, y,lambda);
temp=initial_theta;
initial_theta=initial_theta-(alpha/m)*grad_theta;
j(i)=J;
disp(J);
if abs(temp-initial_theta)<1e-6
    break;
end
end
theta=initial_theta;
plot(1:1:2500,j);
end
