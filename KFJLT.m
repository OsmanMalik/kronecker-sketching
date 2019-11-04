function dist = KFJLT(X, Y, J)
%KFJLT Estimate distance between pairs of Kronecker vectors using KFJLT
%   
%   dist = KFJLT(X, Y, J) computes KFJLT sketches of the column vectors of
%   khatrirao(X) and khatrirao(Y) with a target sketch dimension of J, and
%   then computes the distance between each corresponding vector in
%   khatrirao(X) and khatrirao(Y). These estimated distances are then
%   returned in the vector dist. Note that X and Y should be cells of
%   matrices, and J should be a positive integer.

% Get degree, size and number of trials
degree          = length(X);
[sz, no_trials] = size(X{1});

% Construct Hadamard matrix and empty sketches
H           = hadamard(sz)/sqrt(sz);
X_sketched  = sqrt(sz^degree/J)*ones(J, no_trials);
Y_sketched  = sqrt(sz^degree/J)*ones(J, no_trials);

% Compute sketches
for d = 1:degree
    % Mix
    D           = round(rand(sz, no_trials))*2-1;
    Xd_mixed    = H*(D.*X{d});
    Yd_mixed    = H*(D.*Y{d});
    
    % Sample
    for tr = 1:no_trials
    S                   = randsample(sz, J, true);
    X_sketched(:, tr)   = X_sketched(:, tr).*Xd_mixed(S, tr);
    Y_sketched(:, tr)   = Y_sketched(:, tr).*Yd_mixed(S, tr);
    end
end

% Compute distances
dist    = sqrt(sum((X_sketched-Y_sketched).^2, 1));

end

