

[X1, X2] = meshgrid(-2.00:0.1:2.00, -2.00:0.1:2.00);
Y = zeros(size(X1));

for i=1:length(X1)
    for j=1:length(X2)
        Y(i,j) = A4_func([X1(i,j); X2(i,j)]);
    end
end

surf(X1, X2, Y);
