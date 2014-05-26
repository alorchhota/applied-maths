% this function calculates the mean and standard error of mean(sem) 
% of data (columnwise).
%
% input: 
%   data: a matrix.
% output:
%   m   : mean
%   sem : standard error.
%
% Developer: Ashis Saha
% Date: 2014-03-17
% Last modified: 2014-03-17

function [ m sem ] = meanSEM( data )
    
    % calculate mean
    m = mean(data);
    
    % calculate sem
    sem = std(data)./sqrt(size(data,1)-1);

end

