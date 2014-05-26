% This script is to visualize gradient descent algorithm steps.
%
% Developer: Ashis Saha
% Date: 2014-05-11
% Last modified: 2014-05-11



%% clear workspace; close all figures; clear output window
clear all; close all; clc;

%% define input variables
f = @(x,y) -y.*exp(-x.^2-y.^2);
g = @(x,y) [2.*x.*y.*(exp(-x.^2-y.^2)); exp(-x.^2-y.^2).*(2*y.^2-1)];
xstart = [-2,2]';
lambda = 0.2;
tolerance = 1e-6;
maxiterations = 1000;
range = [-3 3 -3 3];


%% run gradient descent algorithm
[xoptimal foptimal niterations] = gradient_descent2(f,g, xstart, lambda, tolerance, maxiterations, range)

