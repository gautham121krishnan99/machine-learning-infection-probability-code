
load('X_test.mat');
lambda=1;
n=size(X',1);
m=size(X,1);
% w=0;
% X_cv=X(m-1999:end,:);
% X=X(1:m-2000,:);
m=size(X,1);
for i=1:m
    for j2=1:n
        if isnan(X(i,j2))
            X(i,:)=X(i-1,:);
            w=w+1;
        end
    end
end
X=unique(X,'rows');
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
initial_theta=ones(n+1,1);
% % X=[ones(m,1),X];
theta=training(X,y,initial_theta,lambda);
X=[ones(m,1),X];
q=sigmoid(X*theta);
