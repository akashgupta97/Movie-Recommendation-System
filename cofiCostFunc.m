function [J, grad] = cofiCostFunc(params, Y, R, num_users, num_movies, ...
                                  num_features, lambda)
%COFICOSTFUNC Collaborative filtering cost function
%   [J, grad] = COFICOSTFUNC(params, Y, R, num_users, num_movies, ...
%   num_features, lambda) returns the cost and gradient for the
%   collaborative filtering problem.
%

% Unfold the U and W matric es from params
X = reshape(params(1:num_movies*num_features), num_movies, num_features);
Theta = reshape(params(num_movies*num_features+1:end), ...
                num_users, num_features);

            
% 
J = 0;
X_grad = zeros(size(X));
Theta_grad = zeros(size(Theta));
predictions= X*(Theta)';
J= 0.5*(sum(sum(((predictions.*R)-(Y.*R)).^2)))  +  (lambda/2)*(sum(sum(X.*X)) + sum(sum(Theta.*Theta)));

X_grad=(((predictions.*R)-(Y.*R))*Theta) + (lambda.*X);
Theta_grad=(((predictions.*R)-(Y.*R))'*X) + (lambda.* Theta);















% =============================================================

grad = [X_grad(:); Theta_grad(:)];

end
