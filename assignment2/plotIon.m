% This script contains code to plot the graph of Ion Current Vs. Membrane
% Potential. There are two models for this graph: one is linear, while
% another is non-linear.  It uses two values - Conductance (C) and Reverse
% Potential (P) - in the models.
%
% Developer: Ashis Saha
% Date: 2014-03-30
% Last modified: 2014-03-30

%% clear workspace; close all figures; clear output window
clear all; close all; clc;


%% calculated C and P
C = 0.2; %pA/mV
P = -75; %mV



%% plot the line and point
figure;
V = -200:50;        % define voltages in mV
I = C .* (V - P);   % calculate I for the linear equation
plot(V, I);         % plot the linear equation
xlabel('Membrane potential (mV)');  % x label
ylabel('Ion current (pA)');         % y label
title('Ion Current vs. Membrane Potential Graph');

%% show the points
v = [-40, -120];
i = [7, -9];
hold on;                            % more plots to come
plot(v,i,'o','MarkerSize',10);      % plot the points

%% plot the given equation
I1 = (C .* (V - P)) ./ ((1+(0.02 .* (V-P)).^4).^0.25 );     % given eqn
plot(V, I1, 'Color', 'r');    % plot the given eqn

%% legends
legend('linear model','observed points','non-linear model');

%% save figure
saveas(gcf, 'IonPlot.fig');

%% Comments
% When the voltage becomes very large, ion current also increases
% linearly and becomes very large according to the linear model. This is 
% not realistic, the ion current in neuron cannot increase arbitrarily. 
% Usually the ion current becomes saturated (almost fixed) for high (and
% also low) voltage. This is what we observe in the non-linear model (red
% curve).