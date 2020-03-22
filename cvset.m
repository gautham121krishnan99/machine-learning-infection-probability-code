
load('X_test.mat');
load('theta2.mat');
X=X_test;
lambda=1;
n=size(X',1);
X(1:end,7)=X(1:end,7)+66.8014*7^1.2783;
m=size(X,1);
y=X(:,n);
X=X(:,1:n-1);
n=size(X',1);
for i=1:n
    for j=1:n 
    for k=1:n
    X(:,n+j)=((X(:,k).*X(:,j)));
    end
    X(:,n+i)=((X(:,i).*X(:,j)));
    end
end
n2=size(X',1);
for j=1:n
    for k=1:n
    X(:,n2+j)=((X(:,k).*X(:,j)));
    end
end
n3=size(X',1);
for i=1:n
    for j=1:n 
    for k=1:n
        for l=1:n
    X(:,n3+k)=((X(:,k).*X(:,l)));
        end
        X(:,n3+j)=((X(:,k).*X(:,j)));
    end
    X(:,n3+i)=(X(:,i).*X(:,j));
    end
    disp('.');
end
n=size(X',1);
t=(X(:,1:end)-min(X(:,1:end)))./(max(X(:,1:end))-min(X(:,1:end)));
X=t;
m=size(X,1);
X=[ones(m,1),X];
q=sigmoid(X*theta);
