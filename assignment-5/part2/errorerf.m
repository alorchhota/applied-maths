% This script estimates erf() function.
%
% Developer: Ashis Saha
% Date: 2014-04-27
% Last modified: 2014-04-27


%% clear workspace; close all figures; clear output window
clear all; close all; clc;

%% generate data points
k = [1:11]';
X =(k-1)./10;
Y = erf(X);
N = length(X);

%% fit with different polynomials and save max errors
maxErr = zeros(N,1);
for n = 1:N
    % fit with polynomia order n
    fit = poly_fit(X,Y,n);    
    
    % find maximum error
    y = poly_fit_mat(X,n) * fit;
    maxErr(n) = max((Y-y).^2);
end

% plot errors
figure;
plot(1:N,maxErr, '-');
hold on;
title('erf() estimation'); xlabel('Degree'); ylabel('Max Error');

%% fit with different polynomials (only odd ones) and save max errors
maxErrOdd = zeros(N,1);
for i = 1:N
    % fit with polynomia order n without even degrees
    n = 2*i-1;
    fit = poly_fit(X,Y,n,0:2:n);
    
    % find maximum error
    y = poly_fit_mat(X,n,0:2:n) * fit;
    maxErrOdd(i) = max((Y-y).^2);
end

% plot errors
plot(1:2:(2*N-1),maxErrOdd, '-r');
legend('Normal polynomial', 'Odd polynomials')
set(gca,'XTick',1:2:(2*N-1));
saveas(gcf, 'erf-estimation.fig');

%% ########### Comments ###########
% The error reduces as degree increases in both type of fits (both all
% polynomial terms, and only odd degree polynomial terms). However, if only
% odd degree polynomial terms are taken, then same number of polynomial
% terms can consider higher degree terms and produces better results (less
% error). In both cases, 2 polynomial terms [a) c, x, x^2  b) x and x^3] 
% produces good approximation. More polynomial terms can be included for
% higher precision. The later fit is better than the previous, as it has
% less model parameters.

