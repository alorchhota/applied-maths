% This script is to test gradient descent algorithm and explore effects of 
% different parameters.
%
% Developer: Ashis Saha
% Date: 2014-05-11
% Last modified: 2014-05-11



%% clear workspace; close all figures; clear output window
clear all; close all; clc;

%% define input variables
f = @(x) x(1).^2 + x(1).*x(2) + 3*x(2).^2;
g = @(x) [2.*x(1)+x(2); x(1)+6.*x(2)];
xstart = [10,10]';
lambda = 0.2;
tolerance = 1e-6;
maxiterations = 1000;


%% run gradient descent algorithm
[xoptimal foptimal niterations] = gradient_descent(f,g, xstart, lambda, tolerance, maxiterations)


%% run gradient descent algorithm with lambda = 0.4
lambda = 0.4;
[xoptimal foptimal niterations] = gradient_descent(f,g, xstart, lambda, tolerance, maxiterations)

%% comments: 
% whenever lambda is 0.4, x is overshooted because of high update rate. 
% The algorithm misses the minimal point at some point, and keeps on
% overshooting afterwards, and finally reaches infinity.

