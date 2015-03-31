clear all;
load('ex3weights.mat');

load('ex3data1.mat'); % training data stored in arrays X, y
m = size(X, 1);
n = size(X, 2);

X = [ones(m, 1) X];

predict = sigmoid([ones(m, 1) sigmoid(X * Theta1')] * Theta2');
[predict_max, p] = max(predict, [], 2);