% POLYNOMIAL_FIT find polynomial fit of data.
%
% Developer: Ashis Saha
% Date: 2014-04-27
% Last modified: 2014-04-27



function [ fit ] = poly_fit( X, Y, n )
% inputs
%   X : x data
%   Y : y data
%   n : order
%
% outputs
%   fit : polynomial fit

    w = warning;
    warning('off', 'all');
    mat = poly_fit_mat(X,n);
    fit = mat\Y;
    warning(w);
end

