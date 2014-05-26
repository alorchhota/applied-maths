% This script contains code to find the lifetime of a person (in seconds),
% and create a formatted output file. It assumes to have 5 inputs:
% firstName, lastName, birthYear, birthMonth, and birthDate. Then it
% calculates the lifetime. The output file format is as below:
% firstName
% lastName
% birthYear/birthMonth/birthDate
% lifetime in seconds
%
% Developer: Ashis Saha
% Date: 2014-03-14
% Last modified: 2014-03-17

%% clear workspace; close all figures; clear output window
clear all; close all; clc;

%% create a cell variable with 5 entries: firstname, lastname, birth year,
% birth month, birthday
myInfo = {'Ashis', 'Saha', 1984, 7, 1};

%% get current time and birth time
curTime = clock;
birthTime = [myInfo{3:5} 0 0 0];

%% convert time to second ticks
curTicks = time2tick(curTime);
birthTicks = time2tick(birthTime);

%% lifetime is difference between two times
lifeTime = curTicks - birthTicks;

%% print age in second in nice format
disp(sprintf('At the time of calling this script, I was %.0f seconds old.', lifeTime));

%% add lifeTime as 6th entry in myInfo
myInfo{6} = lifeTime;

%% save myInfo in a file
file = fopen('SAHA_ASHIS_myInfo.txt','w');
fprintf(file,'%s\n%s\n%d/%02d/%02d\n%0.f',myInfo{1}, myInfo{2}, myInfo{3}, myInfo{4}, myInfo{5}, myInfo{6});
fclose(file);
