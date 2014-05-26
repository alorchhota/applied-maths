% gradient_descent implements the gradient descent algorithm.
%
% Developer: Ashis Saha
% Date: 2014-05-11
% Last modified: 2014-05-11



function [xoptimal,foptimal,niterations] = ...
    gradient_descent(f, g, xstart, lambda, tolerance, maxiterations)

% inputs
%   f : function handle
%   g : gradient (derivative) handle
%   xstart : staring point
%   lambda : update rate
%   tolerance : small value close to zero which is accepted as zero.
%   maxiterations: maximum iterations.
%
% outputs
%   xoptimal : optimal value of x
%   foptimal : optimal value of f (at xoptimal)
%   niterations : number of iteration required to converge

    %% define initial values
    x = xstart;
    iter = 0;
    
    %% iterate
    while iter < maxiterations
        % check gradient of current value
        gx = g(x);
        if all(abs(gx) <=  tolerance)
            break;
        end
        
        % update x according to gradient
        x = x - lambda * gx;
        iter = iter + 1;
    end
    
    %% give outputs
    xoptimal = x;
    foptimal = f(xoptimal);
    niterations = iter;
end

