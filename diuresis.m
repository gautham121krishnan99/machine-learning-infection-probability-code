load('diuresis_test.mat');
x=[1,2,3,4,5,6];
x=log(x);
y=log((diuresis_test(:,3:8)-diuresis_test(:,2)));
m=size(y,1);
n=6;
K=(sum(y,2).*sum(x.^2)-sum(x).*sum(x.*y(:,1:end),2))./(n*sum(x.^2)-(sum(x))^2);
N=(n*sum(x.*y(:,1:end),2)-sum(y,2).*sum(x))./(n*sum(x.^2)-(sum(x))^2);
b=exp(K);
b=mean(b);
N=mean(N);
load('X_test.mat');
X_27=X_test;
X_27(:,7)=X_27(:,7)+b*7^N;% 7th column has diuresis values
disp(X_27(2:5,7));

