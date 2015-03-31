%load('ex7data2.mat');
%
%% Select an initial set of centroids
%K = 3; % 3 Centroids
%centroids = [3 3; 6 2; 8 5];
%
%idx = zeros(size(X,1), 1);
%
%nd = zeros(length(K), 1);
%
%nd = zeros(length(K), 1);
%
%for  i = 1 : length(X)
%  x = X(i, :);
%  for k = 1 : K
%    c = centroids(k, :);
%    delta = x - c;
%    nd(k) = delta * delta';
%  endfor
%  [value idx(i)] = min(nd);
%endfor
%
%cs = size(centroids);
%%for k = 1 : K 
%  k = 1;
%  indices = find(idx == k);
%  points = X(indices, :);
%  cs(k, :) = mean(points);
%%endfor
%
%%d = X;
%%da = d .- centroids(1, :);
%%db = d .- centroids(2, :);
%%dc = d .- centroids(3, :);
%%
%%dl(1) = da(:,1)' * da(:,1) ;
%%dl(2) = da(:,2)' * da(:,2) ;
%%dist1 = sum(dl, 2);
%%
%%dl(1) = db(:,1) * db(:,1)';
%%dl(2) = db(:,2) * db(:,2)';
%%dist1 = sum(dl, 2);
%%
%%dl(1) = dc(:,1) * dc(:,1)';
%%dl(2) = dc(:,2) * dc(:,2)';
%%dist1 = sum(dl, 2);
clear;
a = 1:1:6;
palette = hsv(6);

colors = palette(a, :);
scatter(a,a,10, colors);