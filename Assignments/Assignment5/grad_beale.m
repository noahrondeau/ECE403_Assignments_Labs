function g = grad_beale(x)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
x1 = x(1);
x2 = x(2);

w1 = (x1*x2 - x1 + 1.5);
w2 = (x1*(x2^2) - x1 + 2.25);
w3 = (x1*(x2^3) - x1 + 2.625);

t11 = 2*(x2 - 1)*w1;
t12 = 2*((x2^2) - 1)*w2;
t13 = 2*((x2^3) - 1)*w3;

g1 = t11 + t12 + t13;

t21 = 2*x1*w1;
t22 = 4*x1*x2*w2;
t23 = 6*x1*(x2^2)*w3;

g2 = t21 + t22 + t23;

g = [g1 ; g2];

end

