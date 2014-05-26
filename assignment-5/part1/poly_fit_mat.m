% POLY_FIT_MAT generate the matrix for polynomial fit.
%
% Developer: Ashis Saha
% Date: 2014-04-27
% Last modified: 2014-04-27


function [ mat ] = poly_fit_mat( X, n )
% inputs
%   X : x data
%   n : order
%
% outputs
%   mat : matrix for polynomial fit

    N = size(X, 1);
    mat = [ones(N,1) cumprod(repmat(X,[1 n]),2)];

end

