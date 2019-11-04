function dist = GS(X, Y, J)
%GS Estimate distance between pairs of Kronecker vectors using Gaussian
%sketch
%
%   dist = GS(X, Y, J) computes Gaussian sketches of the column vectors of
%   khatrirao(X) and khatrirao(Y) with a target sketch dimension of J, and
%   then computes the distance between each corresponding vector in
%   khatrirao(X) and khatrirao(Y). These estimated distances are then
%   returned in the vector dist. Note that X and Y should be cells of
%   matrices, and J should be a positive integer.

% Get degree, size and number of trials
degree          = length(X);
[sz, no_trials] = size(X{1});

% Compute full-sized matrices and construct empty sketches
X_full      = khatrirao(X);
Y_full      = khatrirao(Y);
X_sketched  = zeros(J, no_trials);
Y_sketched  = zeros(J, no_trials);

% Compute sketches
for tr = 1:no_trials
    S                   = randn(J, sz^degree)/sqrt(J);
    X_sketched(:, tr)   = S*X_full(:, tr);
    Y_sketched(:, tr)   = S*Y_full(:, tr);
end

% Compute distances
dist    = sqrt(sum( (X_sketched-Y_sketched).^2, 1 ));

end