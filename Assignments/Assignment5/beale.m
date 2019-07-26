function y = beale(x)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
x1 = x(1);
x2 = x(2);

t1 = x1*x2 - x1 + 1.5;
t2 = x1*(x2^2) - x1 + 2.25;
t3 = x1*(x2^3) - x1 + 2.625;

y = t1^2 + t2^2 + t3^2;
end

