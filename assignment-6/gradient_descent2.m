% gradient_descent2 implements the gradient descent algorithm. It has a
% constraints - it works only on f: R2 -> R. In addition, it shows the
% visualization of the algorithm.
%
% Developer: Ashis Saha
% Date: 2014-05-11
% Last modified: 2014-05-11



function [xoptimal,foptimal,niterations] = ...
    gradient_descent2(f, g, xstart, lambda, tolerance,maxiterations, range)

% inputs
%   f : function handle
%   g : gradient (derivative) handle
%   xstart : staring point
%   lambda : update rate
%   tolerance : small value close to zero which is accepted as zero.
%   maxiterations: maximum iterations.
%   range : range of function parameters to show in the graph.
%
% outputs
%   xoptimal : optimal value of x
%   foptimal : optimal value of f (at xoptimal)
%   niterations : number of iteration required to converge
    
    %% define initial values
    x = xstart;
    iter = 0;
    xs = [xstart];
    fs = [f(x(1),x(2))];
    
    %% iterate
    while iter < maxiterations
        % check gradient of current value
        gx = g(x(1), x(2));
        if all(abs(gx) <=  tolerance)
            break;
        end
        
        % update x according to gradient
        x = x - lambda * gx;
        iter = iter + 1;
        
        % save values in each iteration 
        xs = horzcat(xs,x);
        fs = horzcat(fs,f(x(1),x(2)));
    end
    
    %% give outputs
    xoptimal = x;
    foptimal = f(x(1),x(2))
    niterations = iter;
    
    %% plot graph
    figure;
    ezsurf(f,range);
    hold on;
    plot3(xs(1,:), xs(2,:), fs, '-r', 'LineWidth', 2);
    
end

