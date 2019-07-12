% ECE 403 Assignment 4
% Author: Noah Rondeau

% initialize:
x0 = [0.25 0.15]';
eps = 1e-9;
dt = 0.1;
K = 1000;

f = 'A4_func';
g = 'A4_grad';
h = 'A4_hess';

t0 = cputime;
for i=1:K
    [xs0, fs0, k0] = grad_desc(f,g,x0,eps);
end
t0_avg = (cputime - t0) / K;

t1 = cputime;
for i=1:K
    [xs1, fs1, k1] = newton(f,g,h,x0,dt,eps);
end
t1_avg = (cputime - t0) / K;

disp('======= Gradient descent =======')
fprintf('Average cputime: %f\n', t0_avg);
fprintf('Iterations for convergence: %d\n', k0);
disp('Solution:')
xs0
disp('Function value at solution:');
fs0

disp('======= Gradient descent =======')
fprintf('Average cputime: %f\n', t1_avg);
fprintf('Iterations for convergence: %d\n', k1);
disp('Solution:')
xs1
disp('Function value at solution:');
fs1