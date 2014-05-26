% This script is to visualize several attributes in a dataset and the
% relationship among the attributes. It loads a dataset with 3 attributes:
% Heart rate, weight, and exercise rate. It creates 2 graphs- one with mean
% and standard error of mean of each attribute, and the other with
% relationship among the attribtues.
%
% Developer: Ashis Saha
% Date: 2014-03-17
% Last modified: 2014-03-17

%% clear workspace; close all figures; clear output window
clear all; close all; clc;


%% load experimentData
load('experimentData.mat')

%% calculate mean and SEM
[m sem] = meanSEM(experimentData);


%% plot mean and sem
colnames = {'Heart rate(bpm)', 'Weight (kg)', 'Exercise (hrs)'};
nparticipants = size(experimentData, 1);
ncol = 3;
figure;
for i=1:ncol
    % create a subplot
    subplot(ncol, 1, i);
    
    % plot values with labels
    scatter(1:nparticipants, experimentData(:,i)); 
    xlabel('Participants'); ylabel(colnames{i});
    
    % plot mean and sem
    line([0 nparticipants], [m(i) m(i)],'Color','b', 'LineWidth', 2);
    line([0 nparticipants], [m(i)+sem(i) m(i)+sem(i)], 'LineStyle','--', 'Color','b');
    line([0 nparticipants], [m(i)-sem(i) m(i)-sem(i)], 'LineStyle','--', 'Color','b');
end

% save figure
saveas(gcf, 'analysis.fig');


%% plot relation among columns
figure;

% heart rate vs. weight
subplot(ncol, 1, 1);
scatter(experimentData(:,2), experimentData(:,1)); 
xlabel(colnames{2}); ylabel(colnames{1});

% heart rate vs. exercise rate
subplot(ncol, 1, 2);
scatter(experimentData(:,3), experimentData(:,1)); 
xlabel(colnames{3}); ylabel(colnames{1});

% weight vs. exercise rate
subplot(ncol, 1, 3);
scatter(experimentData(:,3), experimentData(:,2)); 
xlabel(colnames{3}); ylabel(colnames{2});

% save figure
saveas(gcf, 'analysis2.fig');

%% comments on data
% 1) Heart rate has a tendency to increase as weight increases.
% 2) Heart rate has a tendency to decrease as exercise rate increases.
