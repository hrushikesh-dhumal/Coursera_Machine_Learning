clc;clear all; close all;

data = load('ex1data2.txt');
X = data(:, 1:2);
y = data(:, 3);
%X = 10 * rand(1000, 50);
%y = rand(1000,1);
m = length(y);
theta = zeros(size(X,2) + 1, 1);
alpha = 0.01;
num_iters = 400;

X_norm = X;
mu = zeros(1, size(X, 2));
sigma = zeros(1, size(X, 2));

mu = mean(X_norm);
sigma = std(X_norm);


%tic
%X_norm = bsxfun('rdivide',(bsxfun('minus', X, mu)), sigma);
for i = 1 : size(X, 2);
    X_norm2(:, i) = (X(:, i) - mu(i)) / sigma(i);
end
%toc


X = [ones(m, 1) X];


#{
tic
J2 = (sum(((sum((bsxfun ('times', X, theta'))'))' - y) .^2)) / (2 * m);
toc

tic
cost = ((X * theta - y)' * (X * theta - y))  / (2 * m);
toc

tic
sum = 0;
for i = 1 : m
   sum = sum + (X (i ,:) * theta - y(i)) ^ 2;
end

J = sum / (2 * m);
toc
#}


for iter = 1:num_iters
  %theta = theta - (alpha * sum(X .* ((sum((bsxfun ('times', X, theta'))'))' - y)) / m)';
    sum = zeros(size(X, 2), 1); % OR sum = zeros(size(theta));
    for i = 1 : m
       sum = sum + (X (i ,:) * theta - y(i)) * X (i ,:)';
    end
    
    theta  = theta - alpha * sum / m;
end


theta2 = pinv(X' * X) * (X' * y);
