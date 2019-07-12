function H = A4_hess(x)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
x1 = x(1);
x2 = x(2);
h11 = 30*(x1^4) + 12*(x1^2) - (12*x1) - (12*x1*x2) - (4*x2);
h12 = -6*(x1^2) - (4*x1);
h22 = 4;
H = [h11 h12; h12 h22];
end

