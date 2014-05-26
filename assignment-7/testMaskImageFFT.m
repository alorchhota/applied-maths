% This script is to play with fourier analysis to remove regular noise.
%
% Developer: Ashis Saha
% Date: 2014-05-25
% Last modified: 2014-05-25



%% clear workspace; close all figures; clear output window
clear all; close all; clc;

%% define input variables
inputImage = 'pic2.png';

%% call maskImageFFT
nClicks = 6;
filterSize = 20;
maskImageFFT(inputImage, nClicks, filterSize);

    
%% Try a new image
inputImage = 'lena-noisy.jpg';

%% call maskImageFFT
nClicks = 10;
filterSize = 20;
maskImageFFT(inputImage, nClicks, filterSize);

    
