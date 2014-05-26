% This script finds a good polynomial fit of gangnam-style views, 
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
X = psy(:,1);
Y = psy(:,2);
N = size(X, 1);           % #data poins

figure;
for n = 1:N
    % fit with polynomia order n
    fit = poly_fit(X,Y,n);    
    
    %% create model graph
    x = [1:5:100]';
    y = poly_fit_mat(x,n) * fit;
    subplot(ceil(sqrt(N)), ceil(sqrt(N)), n )
    plot(x,y, '-');
    title(sprintf('n = %d',n));
    hold on;
    plot(X,Y,'*');
    hold on;
    
    
end

%% save graph of all models
saveas(gcf,'gangnam-models.fig','fig');

%% ######### Comments-1 ##############
% According to the models with degree 5 to 15 (except 14) the view-count 
% decreases with large time, which is unrealistic. Degree 14 overfits the
% data.

%% Analyze degree 1 to 4
N1 = 4;
modelError = zeros(N1,1);    % model error
%E = repmat([1], [N1,1]);     % error tolerance 1 million
E = Y .* 0.1 + 0.1;     % noise = 10% of original value + 0.1 million

figure;
for n = 1:N1
    % fit model
    fit = poly_fit(X,Y,n);
    
    % calculate percentage of points outside error bar
    y = poly_fit_mat(X,n) * fit;
    modelError(n) = 1 - sum(abs(Y-y) < E) / N ;

    % plot graph with error bar
    y = poly_fit_mat(X,n) * fit;
    subplot(2, 2, n)
    plot(X,y, '-');
    title(sprintf('n = %d',n)); xlabel('Days'); ylabel('View (million)');
    hold on;
    errorbar(X,Y,E,'xr')
end
saveas(gcf, 'gangnam-simple-models.fig', 'fig');

%% display error in each model
disp('Degree   Model Error(%)')
disp([[1:N1]', modelError])


%% ######### Comments-2 ##############
% If we assume 10% noise with each data point, 
% models with degree 1,2,3,4 have error rates of  86.67, 26.67, 13.33, 20%
% respectively. 
% Degree-1 has too high error rate, and thus discardable.
% Degree-3 has the least error rate. Thus degree-4 model is discardable.
% Degree-2 and 3 are possible candidates. Even though degree-2 model has
% less accuracy than degree-3 model, and degree-2 model shows a decrease in
% view count from day to 0 to day 20, I would go for the degree-2 model 
% following the occum's razor principle. Thi model is the simplest model 
% that produces reasonable accuracy.


%% predict time to reach 300, 500, and 1000 million viewers.
% draw graph for a big range to have at least 1000 million viewers.
n = 2;
fit = poly_fit(X,Y,n);
maxX = 150;
x = [0:10:maxX]';
y = poly_fit_mat(x,n) * fit;
figure;
plot(x,y, '-');
title('Gangnam Style Views'); 
xlabel('Days'); ylabel('Views (million)'); axis([0, maxX, 0, 1200]);
hold on;
set(gca,'XTick',x)
d=77; v=300; plot([0,d],[v,v], 'r'); plot([d,d],[0,v],'r');
d=97; v=500; plot([0,d],[v,v], 'r'); plot([d,d],[0,v],'r');
d=132; v=1000; plot([0,d],[v,v], 'r'); plot([d,d],[0,v],'r');
saveas(gcf,'gangnam-predict.fig');

%% ######### Comments-3 ##############
% According to the selected model, gangnam style would have 300, 500, and
% 1000 million views after 77, 97, and 132 days respectively.
