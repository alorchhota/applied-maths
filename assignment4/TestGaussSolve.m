% This script contains code to test the Gauss Elimination technique.
%
% Developer: Ashis Saha
% Date: 2014-04-15
% Last modified: 2014-04-15


%% clear workspace; close all figures; clear output window
clear all; close all; clc;



%% Test GaussSolve() with built-in method
unknowns = [1,5,10,100,250,500,750,1000];    % #unkowns
gaussSolveTime = zeros(length(unknowns),1);  % time taken by GaussSolve()
builtInTime = zeros(length(unknowns),1);     % time taken by built-in method


for i = 1:length(unknowns)
    n = unknowns(i);
    
    % generate A with random number from -10 to +10
    A = -10 + 20 * rand(n,n);
    
    % generate b with random number from -1000 to +1000
    b = -1000 + 20000 * rand(n,1);
    
    % run GaussSolve()
    tic;
    x = GaussSolve(A,b);
    gaussSolveTime(i) = toc;
    
    % run built-in method
    tic;
    x = A\b;
    builtInTime(i) = toc;
    
end

%% calculate how much faster is the built-in method
fastnessFactor = gaussSolveTime ./ builtInTime;
meanFactor = mean(fastnessFactor);
sdFactor = std(fastnessFactor);
disp(sprintf('On the average, the backslash command is (%.1f %s %0.1f) times as fast as our GaussSolve() method.', meanFactor, setstr(177), sdFactor));

%% plot performance analysis
plot(unknowns, gaussSolveTime, 'bo-');
hold on;
plot(unknowns, builtInTime,'rx-');
title('Performance Comparison');
xlabel('# of unknowns');
ylabel('Execution time');
legend('GaussSolve() method', 'Backslash command');
saveas(gcf, 'performance.fig');


%% solution of the truss
forces = ['F1'; 'F2';'F3';  'H2';'V2';'V3'];
A = [-cos(pi/6)  0  cos(pi/3)  0  0  0;
     -sin(pi/6)  0  -sin(pi/3) 0  0  0;
     cos(pi/6)   1  0          1  0  0;
     sin(pi/6)   0  0          0  1  0;
     0          -1  -cos(pi/3) 0  0  0;
     0           0  sin(pi/3)  0  0  1];
 
 b = [0; -1000; 0; 0; 0; 0];
 f = GaussSolve(A,b);
 disp('Truss Solution:');
 disp(strcat(forces, repmat(' = ',6,1), num2str(f), repmat(' kg',6,1)));

 
 %% Comments: part-c
% On the average, the backslash command is (138.8 ± 97.5) times as fast as
% our GaussSolve() method. The possible reason is that the built-in 
% backslash command has been multithreaded and optimally compiled. There
% are opportunities for parallel computation in the Gaussian Elimination
% technique. However, our implementation does not take the advantage of
% parallel computing using multiple threads. There may have compilation
% issue as well.