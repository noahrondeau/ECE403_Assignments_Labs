function H = hess_beale(x)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
x1 = x(1);
x2 = x(2);

h11 = 2*(x2^6) + 2*(x2^4) - 4*(x2^3) - 2*(x2^2) - 4*x2 + 6;
h22 = 30*(x1^2)*(x2^4) + 12*(x1^2)*(x2^2) - 12*(x1^2)*(x2) - 2*(x1^2) + 31.5*x1*x2 + 9*x1;
h12 = 12*x1*(x2^5) + 8*x1*(x2^3) - 12*x1*(x2^2) - 4*x1*x2 -4*x1 + 15.75*(x2^2) + 9*x2 + 3;

H = [h11 h12; h12 h22];
end

