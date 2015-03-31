clear all;clc;
data = load('ex2data2.txt');
X = data(:, [1, 2]); y = data(:, 3);

X = mapFeature(X(:,1), X(:,2));

theta = rand(size(X, 2), 1);
lambda = 1;
m = length(y);

J = sum(-y .* log(sigmoid(X * theta)) - (1 - y).* log(1 - sigmoid(X * theta))) / m + lambda * sum(theta .^ 2) / (2 * m);
J2 = sum(-y .* log(sigmoid(X * theta)) - (1 - y).* log(1 - sigmoid(X * theta))) / m + lambda * sum(theta([2:end]) .^ 2) / (2 * m);

grad = zeros(size(theta));

grad = X' * (sigmoid(X * theta) - y) / m + lambda * theta / m;

w = ( X(:,1)' * (sigmoid(X * theta) - y)) / m;

grad2 = X' * (sigmoid(X * theta) - y) / m;
temp = theta; 
temp(1) = 0;   
grad3 = grad2 + lambda * temp / m;
