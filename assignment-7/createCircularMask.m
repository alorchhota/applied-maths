% this function create a circular mask.
%
% Developer: Ashis Saha
% Date: 2014-05-25
% Last modified: 2014-05-25

function [ mask ] = createCircularMask(width, height, radius, centerx, centery)

% InputS:
%    width  : width of image
%    height : height of image
%    radius : radius of circular mask
%    centerx: center of mask
%    centery: center of mask
%
% outputs:
%    mask : mask matrix (1 means masking points)

    [W,H] = meshgrid(1:width, 1:height);
    mask = sqrt((W-centerx).^2 + (H-centery).^2) < radius;
    
end

