% POLY_FIT_MAT generate the matrix for polynomial fit.
%
% Developer: Ashis Saha
% Date: 2014-04-27
% Last modified: 2014-04-27
function [ mat ] = poly_fit_mat( X, n, excluded)
% inputs
%   X : x data
%   n : order
%	excluded : the degrees to exclude in the model
%
% outputs
%   mat : matrix for polynomial fit
    
    if length(n) ~= 1 || n<1
        stop('n must be a positive integer');
    end
    
    if nargin <= 2
        excluded = [];
    end
    
    N = size(X, 1);
    mat = [ones(N,1) cumprod(repmat(X,[1 n]),2)];
    mat = mat(:, setdiff(1:n+1,excluded+1));
end

