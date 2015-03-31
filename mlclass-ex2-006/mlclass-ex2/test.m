clear all;
data = load('ex2data1.txt');
X = data(:, [1, 2]); y = data(:, 3);

[m, n] = size(X);

X = [ones(m, 1) X];

theta = zeros(n + 1, 1);

 J = sum(-y .* log(sigmoid(X * theta)) - (1 - y).* log(1 - sigmoid(X * theta))) / m;
  J2 = sum(-y .* log(sigmoid(X * theta)) - (1 - y).* log(1 - sigmoid(X * theta))) / m + lambda * sum(theta([2:end]) .^ 2) / (2 * m);

 %grad2 = (sum((sigmoid(X * theta) - y) .* X))' / m;

 %grad3 = X' *(sigmoid(X * theta) - y) / m;

for i = 1 : size(theta, 1)
    grad(i, 1) = ( X(:, i)' * ( sigmoid( X * theta ) - y )) / m; 
end



