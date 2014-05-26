% This function shows the fourier spectrum to user to filter some of the
% noise patterns, and then revert back the image.
%
% Developer: Ashis Saha
% Date: 2014-05-25
% Last modified: 2014-05-25



function maskImageFFT(inputImage,nClicks,filterSize)

% inputs
%   inputImage : image file path
%   nClicks    : #points to filter
%   filterSize : filter size


    %% load the image and convert it to gray scale
    I = imread(inputImage);
    if(size(I,3)==3)
        I = rgb2gray(I);
    end

    %% display the image on screen
    figure;
    imshow(I);

    %% show the fourier spectrum
    F = fftshift(fft2(I));
    figure;
    imshow(log(1+abs(F)),[], 'InitialMagnification', 100);

    %% take input from users
    [x,y] = ginput(nClicks);
    
    %% mask user points
    hs = filterSize/2;  % half size of filter
    M = ones(size(F));
    for i = 1:nClicks
        % mask as rectangle
        %M = ones(size(F));
        %M(max(1,(x(i)-hs)):min(size(F,1),(x(i)-hs+filterSize)), max(1,(y(i)-hs)):min(size(F,2),(y(i)-hs+filterSize))) = 0;
        
        % mask as circle
        M1 = createCircularMask(size(F,2), size(F,1), hs, x(i), y(i));
        M1 = 1 - M1;
        M = M .* M1;
    end
    
    % mask
    F = F.*M;
    
    %% inverse fourier transform
    invI = ifft2(ifftshift(F));
    
    %% show the inverse image
    figure; imshow(abs(invI),[]);


end
