function g = grad_logistic(y,w_hat,x_hat, N)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

a = exp(-y*w_hat'*x_hat);
g = (-1/N)*((y * a) / (1 + a))*x_hat;
end

