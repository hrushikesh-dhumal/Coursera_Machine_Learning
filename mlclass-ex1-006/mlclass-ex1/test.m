clc;clear all;close all;

data = load('ex1data1.txt');
X = data(:, 1); y = data(:, 2);
m = length(y);

X = [ones(m, 1), data(:,1)]; % Add a column of ones to x
theta = zeros(2, 1);

alpha = 0.01;
num_iters = 1500;
%tic
%sum = 0;
%for i = 1: m
% sum = sum + X(i, :) * theta;
%end

%J = sum /(2 *m );
%toc


%tic
%J = (sum(((sum((bsxfun ('times', X, theta'))'))' - y) .^2)) / (2 * m);
%toc


    %common_part = (sum((X .* theta')'))' - y;
    %delta_theta = alpha * sum(X .* common_part) / m;
    %theta = theta - delta_theta';
    
    
    %theta = theta - (alpha * sum(X .* ((sum((bsxfun ('times', X, theta'))'))' - y)) / m)';
    
    
    
    
    
    
    
    
tic  
  for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %

    %common_part = (sum((bsxfun ('times', X, theta'))'))' - y;
    %delta_theta = alpha * sum(X .* common_part) / m;
    %theta = theta - delta_theta';

    theta = theta - (alpha * sum(X .* ((sum((bsxfun ('times', X, theta'))'))' - y)) / m)';


    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);

end 
toc