% this function solves a system of linear equations (Ax = b) using Gaussian
% Elimination technique with pivoting.
%
% input: 
%   A   : coffecient matrix
%   b   : right-hand-side matrix
% output:
%   x   : solution of x
%   det : determinant of A
%
% Developer: Ashis Saha
% Date: 2014-04-15
% Last modified: 2014-04-15

function [x det] = GaussSolve(A, b)
    
    %% check if A is a square matrix
    sa = size(A);
    if ~isequal(size(sa),[1 2]) 
        error('Error: A must be a 2D matrix.');
    elseif sa(1)~=sa(2)
        error('Error: A must be a square matrix.');
    end
    
    %% check whether dimensions of A and b fit
    sb = size(b);
    if sa(1) ~= sb(1)
        error('Error: Dimensions of A & b do not match');
    elseif sb(2)~=1
        error('Error: b must have exactly one column.')
    end
    
    %% combine A and b for easiness in calculation
    g = horzcat(A,b);
    
    %% forward elimination method with pivoting
    %disp('forward elimination:')   % code to display runtime
    %tic                            % code to display runtime
    for i = 1 : sa(1)-1
        % pivot
        [pivot, pivotIndex] = max(abs(g(i:end,i)));
        if pivotIndex ~= 1
            g([pivotIndex+i-1, i],:) = g([i, pivotIndex+i-1],:); % swap
        end
        
        % check zero pivot
        if pivot == 0
            error('Error: a pivot element became 0.');
        end
        
        % forward elimination
        for j = i+1 : sa(1)
            factor = g(j,i)/g(i,i);
            g(j,i:end) = g(j,i:end) - factor .* g(i, i:end);
        end
    end
    
    %toc                             % code to display runtime
    
    %% backward substitution
    %disp('backward substitution:') % code to display runtime
    %tic                            % code to display runtime
    x = zeros(sa(1),1);
    x(sa(1)) = g(sa(1),sa(2)+1) ./ g(sa(1),sa(2));
    for i = sa(1)-1 : -1 : 1
        x(i) = (g(i,sa(2)+1) - g(i, i+1:end-1) * x(i+1:end,:)) ./ g(i,i);
    end
    %toc                            % code to display runtime

%     %% determinant
%     det = 1;
%     for i = 1 : sa(1)
%         det = det .* g(i,i);
%     end

    det = 0;

end


%% Comments: part-b
% The forward elimination with pivoting part takes the longest to run.

