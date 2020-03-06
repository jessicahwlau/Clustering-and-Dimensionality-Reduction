%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% CSC C11 - Assignment 3 - K-Means++ Center Initialization Algorithm
%
% This function implements K-Means++ center initialization algorithm 
% for a set of input vectors, and an *initial* set of cluster centers.
%
% function [centers]=init_centers(data,k,init_algo)
%
% Inputs: data - an array of input data points size n x d, with n 
%                input points (one per row), each of length d.
%         k - number of clusters
%         init_algo - the center initialization algorithm to use for 
%                     the k centers. The default is random initialization,
%		      but when init_algo is "kmeans++" it returns initial
%                     centers based on the kmeans++ alg.
%
% Outputs: centers - Initial cluster centers
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [centers] = init_centers(data,k,init_algo)
  centers = zeros(k, size(data, 2));

  if (strcmpi(init_algo, "kmeans++"))
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % TO DO: Complete this part so that your code chooses k initial
    %        centers using K-Means++ algorithm. 
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % runs k-means++ initialization algorithm
    new_centers = [];
    random_permutation = randperm(size(data, 1), 1);
    new_centers(1,:) = data(random_permutation, :);
    distance = [];
    prob = [];
    for i = 1:k-1
        count = 1;
        while (count <= size(new_centers,1))
            distance(count,:) = sqrt(sum(((data-new_centers(count,:)).^2),2));
            prob(count,:) = (distance(count,:).^2)/sum(distance(count,:).^2);
            count = count+1;
        end

        m=[];
        CDF = cumsum(prob);
        while isempty(m)
            z = rand(1,1);
            m = find(CDF>z);
        end
        new_centers(i+1,:) = data(m(1),:);
    end    
    centers = new_centers;
    

  else
    % choose initial centers randomly
    random_permutation = randperm(size(data, 1), k);
    centers = data(random_permutation, :);
  end;
