% POLYNOMIAL_FIT find polynomial fit of data.
%
% Developer: Ashis Saha
% Date: 2014-04-27
% Last modified: 2014-04-27

function [ fit ] = poly_fit( X, Y, n, excluded)
% inputs
%   X : x data
%   Y : y data
%   n : order
%	excluded : the degrees to exclude in the model
%
% outputs
%   fit : polynomial fit

    if nargin <= 3
        excluded = [];
    end

    w = warning;
    warning('off', 'all');
    mat = poly_fit_mat(X, n, excluded);
    fit = mat\Y;
    warning(w);
end

