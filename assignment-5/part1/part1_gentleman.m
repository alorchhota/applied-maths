% This script finds a good polynomial fit of gentlleman views, 
% and predicts some data.
%
% Developer: Ashis Saha
% Date: 2014-04-27
% Last modified: 2014-04-27



%% clear workspace; close all figures; clear output window
clear all; close all; clc;


%% read data
load('part1-data.mat')

%% prepare gangnam style data
X = gentleman(:,1);
Y = gentleman(:,2);
N = size(X, 1);           % #data poins

figure;
for n = 1:N
    % fit with polynomia order n
    fit = poly_fit(X,Y,n);    
    
    %% create model graph
    x = [1:100]';
    y = poly_fit_mat(x,n) * fit;
    subplot(ceil(sqrt(N)), ceil(sqrt(N)), n )
    plot(x,y, '-');
    title(sprintf('n = %d',n));
    hold on;
    plot(X,Y,'*');
    hold on;
    
    
end

%% save graph of all models
saveas(gcf,'gentleman-models.fig','fig');

%% ######### Comments-1 ##############
% According to the models with degree 2,3,5,9,10, the view-count 
% decreases with large time, which is unrealistic. Degree above 7 would 
% overfit the data due to small number of samples. So, the remainng 
% candidates are degree 1, 4, 6, 7. 

%% Analyze candidate degrees
candidates = [1 4 6 7];
N1 = length(candidates);
modelError = zeros(N1,1);    % model error
%E = repmat([1], [N1,1]);     % error tolerance 1 million
E = Y .* 0.1 + 0.1;     % noise = 10% of original value + 0.1 million

figure;
for i = 1:N1
    n = candidates(i);
    % fit model
    fit = poly_fit(X,Y,n);
    
    % calculate percentage of points outside error bar
    y = poly_fit_mat(X,n) * fit;
    modelError(i) = 1 - sum(abs(Y-y) < E) / N ;

    % plot graph with error bar
    y = poly_fit_mat(X,n) * fit;
    subplot(2, 2, i)
    plot(X,y, '-');
    title(sprintf('n = %d',n)); xlabel('Days'); ylabel('View (million)');
    hold on;
    errorbar(X,Y,E,'xr')
end
saveas(gcf, 'gentleman-simple-models.fig', 'fig');

%% display error in each model
disp('Degree   Model Error(%)')
disp([candidates(1:N1)', modelError])


%% ######### Comments-2 ##############
% If we assume 10% noise with each data point, models with degree 1,4,6,7 
% have error rates of  50, 17, 0, 0% respectively. 
% Degree-6 has the least error rate. Thus degree-7 model is discardable.
% Degree-1, 4 and 6 are possible candidates. Even though degree-4 model has
% less accuracy than degree-6 model, according to the occum's razor 
% principle, degree-4 model is better than degree-6, as it gives reasonable
% accuracy. 
% Now the remaining degrees are 1 and 4. 
% The error rate of degree 1 is a bit too high. 
% Thus the remaining candidate is degree 4. 
% However, as data has been observed for only a small number of days, 
% it may not fit be a good model for long values of time.


%% predict time to reach 300, 500, and 1000 million viewers.
% draw graph for a big range to have at least 1000 million viewers.
n = 4;
fit = poly_fit(X,Y,n);
maxX = 25;
x = [0:1:maxX]';
y = poly_fit_mat(x,n) * fit;
figure;
plot(x,y, '-');
title('Gentleman Views'); 
xlabel('Days'); ylabel('Views (million)'); axis([0, maxX, 0, 1200]);
hold on;
set(gca,'XTick',x)
d=12; v=300; plot([0,d],[v,v], 'r'); plot([d,d],[0,v],'r');
d=14; v=500; plot([0,d],[v,v], 'r'); plot([d,d],[0,v],'r');
d=16.5; v=1000; plot([0,d],[v,v], 'r'); plot([d,d],[0,v],'r');
saveas(gcf,'gentleman-predict.fig');

%% ######### Comments-3 ##############
% According to the selected model, gentleman would have 300, 500, and
% 1000 million views after 12, 14, and 16.5 days respectively.
