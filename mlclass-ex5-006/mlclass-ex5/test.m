clear all;
load ('ex5data1.mat');
m = size(X, 1);
theta = [1 ; 1];
%X = [ones(m, 1) X];
lambda = 1;

%h = X * theta;
%theta_reg = [0;theta(2:end, :)];
%J = (1 / 2 / m) * (sum((h - y) .^ 2) + lambda * sum(theta_reg .^ 2));

%grad = (1 / m) * (X' * (h - y) + lambda * theta_reg);
error_train = zeros(m, 1);
error_val   = zeros(m, 1);
m = size(X, 1);

for i = 1 : m 
  fprintf('In loop %d ..' , i);
  theta = trainLinearReg([X(1: i, :)], y(1 : i, 1), 1);
  error_train(i, 1) = linearRegCostFunction(X(1: i, :), y(1 : i, :), theta, 0);
  error_val(i, 1) = linearRegCostFunction(Xval, yval, theta, 0);
endfor