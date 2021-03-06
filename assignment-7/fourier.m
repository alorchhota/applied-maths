% This script is to play with fourier analysis.
%
% Developer: Ashis Saha
% Date: 2014-05-25
% Last modified: 2014-05-25



%% clear workspace; close all figures; clear output window
clear all; close all; clc;

%% define input variables
imgFile = 'pic1.PNG';
I = imread(imgFile);
I = rgb2gray(I);

%% fourier spectrum
F = fft2(I);
F = fftshift(F);
figure; imshow(abs(F), []);

%% log scaled spectrum
figure; imshow(log(1+abs(F)), []);

%% comments
% From unscaled spectrum, it is clear that the most visible pattern
% repeats horizontally i.e. if we move horizontally, we will watch a
% periodic pattern. The log-scalled spectrum shows that there are more 
% patterns other than horizontally repeated patterns. There is vertical
% black lines. The changes in both directions are not sharp, so there are
% many spectrum lines both horizontally and vertically.