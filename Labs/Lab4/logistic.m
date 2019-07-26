function f = logistic(y,w_hat,x_hat, N)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

f = (1 / N) * sum(log(1 + exp(-y*w_hat'*x_hat));
end

