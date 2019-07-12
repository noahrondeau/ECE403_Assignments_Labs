function grad = A4_grad(x)
x1 = x(1);
x2 = x(2);
g1 = 6*(x1^2)*((x1^3) - x2 - 1) + (4*x1*( (x1^2) - x2 ));
g2 = -2*((x1^3) - x2 - 1) - (2*((x1^2) - x2 ));
grad = [g1; g2];
end

