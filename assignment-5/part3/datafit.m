% This script handles data fitting.
%
% Developer: Ashis Saha
% Date: 2014-04-27
% Last modified: 2014-04-27


%% clear workspace; close all figures; clear output window
clear all; close all; clc;

%% generate data points
t = 1:25;
y = [5.0291,6.5099,5.3666,4.1272,4.2948,6.1261,12.5140,10.0502,9.1614,...
    7.5677,7.2920,10.0357,11.0708,13.4045,12.8415,11.9666,11.0765,...
    11.7774,14.5701,17.0440,17.0398,15.9069,15.4850,15.5112,17.6572];
X =t';
Y = y';

%% fit with different polynomials and save max errors
fit = poly_fit(X,Y,1);

%% calculate and plot residuals
res = poly_fit_mat(X,1) * fit - Y;
figure;
plot(X, res); title('Resuduals'); 
xlabel('t'); ylabel('Residuals');
saveas(gcf, 'residual-1.fig', 'fig');

%% remove outlier
outliers = abs(res) >= max(abs(res));
X0 = X(outliers);
Y0 = Y(outliers);
X1 = X(~outliers);
Y1 = Y(~outliers);

%% linear fit with revised data
fit = poly_fit(X1,Y1,1);

%% calculate and plot new residuals
res = poly_fit_mat(X1,1) * fit - Y1;
figure;
plot(X1, res); title('Resuduals'); 
xlabel('t'); ylabel('Residuals');
saveas(gcf, 'residual-2.fig', 'fig');

%% ########## Comments-1 ################
% Residuals seems to follow a sine curve.

%% fit data with B1 + B2t + B3.sin(t)
fitMat = poly_fit_mat(X1,1);
fitMat = [fitMat, sin(X1)];
fit = fitMat\Y1;

% evaluate the fit on a finer grid
X2 = [0:26]';
Y2 = [poly_fit_mat(X2,1), sin(X2)] * fit;

%% plot fitted curve, original data, and outliers
figure;
plot(X2,Y2,'-');
hold on;
plot(X1,Y1,'or');
scatter(X0,Y0,'x');
title('Data Fitting'); xlabel('t'); ylabel('y(t)');
legend('fitted', 'original', 'outlier', 'Location','NorthWest');
saveas(gcf, 'fit.fig');

%% ############ Comments-2 #############
% Any pattern in residual implies that the residuals are not merely because
% of random noise. So, inclusion of that pattern in the model improves the
% fit.






