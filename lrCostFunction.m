function [J, grad] = lrCostFunction(theta, X, y, lambda)
m = length(y);
grad = zeros(size(theta));
temp=X*theta;
h=1./(1+exp(-temp));
temp=-y.*log(h)-(1-y).*log(1-h);
z=0;
for i=1:size(theta)
    if i~=1
    grad(i)=(1/m)*(sum(X(:,i).*(h-y))+lambda*theta(i));
     z=z+theta(i)^2;
    else
    grad(i)=(1/m)*(sum(X(:,i).*(h-y)));
    end
   
end
S=sum(temp);
S=(S+0.5*lambda*z)/m;
J=S;
    


grad = grad(:);

end
