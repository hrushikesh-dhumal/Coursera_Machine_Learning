clear all;

load('ex3data1.mat'); % training data stored in arrays X, y
m = size(X, 1);
n = size(X, 2);

X = [ones(m, 1) X];

initial_theta = zeros(size(X, 2), 1);
lambda = 0.1;
classifier = 1:10;

y1 = y == classifier(1);
num_labels = 10;
all_theta = zeros(num_labels, n + 1);

% Set Options
options = optimset('GradObj', 'on', 'MaxIter', 10);

for i = 1 : 10  
  y1 = y == classifier(i);
  % Optimize
  [theta, J, exit_flag] = ...
	fmincg(@(t)(lrCostFunction(t, X, y1, lambda)), initial_theta, options);
  
  all_theta(i,:) = theta';
end

predict = sigmoid(X*all_theta');
[predict_max, index_max] = max(predict, [], 2);

