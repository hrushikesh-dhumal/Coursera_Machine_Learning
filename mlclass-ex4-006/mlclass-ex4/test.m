clear all;
input_layer_size  = 400;  % 20x20 Input Images of Digits
hidden_layer_size = 25;   % 25 hidden units
num_labels = 10;          % 10 labels, from 1 to 10   

load('ex4data1.mat');
m = size(X, 1);

load('ex4weights.mat');
nn_params = [Theta1(:) ; Theta2(:)];

lambda = 0;

J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

%Add bias unit to input
A = [ones(m, 1) X];

hyp = sigmoid([ones(m, 1) sigmoid(A * Theta1')] * Theta2');

I = eye(num_labels);
Y = zeros(m, num_labels);
for i=1:m
  Y(i, :)= I(y(i), :);
end

%cost2 = (-Y).*log(hyp) - (1-Y).*log(1-hyp);
%J2 = (1/m)*sum(sum(cost, 2));

Delta_2 = 0;
Delta_1 = 0;
for i = 1 : m
  a_1 = [1; X(i, :)'];
  
  %Layer 2  
  z_2 = Theta1 * a_1;
  a_2 = [1 ; sigmoid(z_2)];
  
  y1 = zeros(num_labels,1);
  y1(y(i),1) = 1;
  
  %Layer 3
  z_3 = Theta2 * a_2;
  a_3 = sigmoid(z_3);  
  
  %Calculate the small deltas(errors in each layer)
  d_3 = a_3 - y1;
  d_2 = (Theta2(:, 2 : end)' * d_3).* sigmoidGradient(z_2);
  
  %Accumulate gradient
  Delta_2 = Delta_2 + d_3 * a_2';
  Delta_1 = Delta_1 + d_2 * a_1';
endfor

Theta1_grad = (1/m) * Delta_1;
Theta2_grad = (1/m) * Delta_2;
Theta1_grad(:,2:end) = Theta1_grad(:,2:end) + ((lambda / m) * Theta1(:,2:end));
Theta2_grad(:,2:end) = Theta2_grad(:,2:end) + ((lambda / m) * Theta2(:,2:end));


