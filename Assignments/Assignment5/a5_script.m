
% ECE 403
% Assignment 5 Problem 2.10
% Author: Noah Rondeau V00816430

%NOTE: THE FUNCTIONS grad_desc, newton, and bfgs HAVE BEEN MODIFIED TO
%OUTPUT ALL THE x_k FOR ALL k IN THE ARRAY xs, WHERE THE LAST ELEMENT IS
%THE SOLUTION (IF ONE IS FOUND)
%THEY HAVE ALSO BEEN MODIFIED TO STOP ITERATING AFTER 2000 ITERATIONS
%(ARBITRARY). THIS IS TO PREVENT RUNAWAY TOWARDS AN ASYMPTOTIC MINIMUM. SEE
%THE NEW FUNCTIOSN ATTACHED.

clc;
clear all;
close all;
clc;
% convergence epsilon
eps = 1e-6;
% newton correction
dt = 0.1;

% initial points
x01 = [2 ; 3];
x02 = [-3 ; 3];
x03 = [2 ; -3];
x04 = [-3 ; -3];

% gradient descent
disp('Grad descent with x01 = [2 ; 3]:');
xs_gd_01 = grad_desc('beale','grad_beale',x01, eps);
disp('Grad descent with x02 = [-3 ; 3]:');
xs_gd_02 = grad_desc('beale','grad_beale',x02, eps);
disp('Grad descent with x03 = [2 ; -3]:');
xs_gd_03 = grad_desc('beale','grad_beale',x03, eps);
disp('Grad descent with x04 = [-3 ; -3]:');
xs_gd_04 = grad_desc('beale','grad_beale',x04, eps);

disp('Newton with x01 = [2 ; 3]:');
xs_nt_01 = newton('beale','grad_beale','hess_beale',x01,dt,eps);
disp('Newton with x02 = [-3 ; 3]:');
xs_nt_02 = newton('beale','grad_beale','hess_beale',x02,dt,eps);
disp('Newton with x03 = [2 ; -3]:');
xs_nt_03 = newton('beale','grad_beale','hess_beale',x03,dt,eps);
disp('Newton with x04 = [-3 ; -3]:');
xs_nt_04 = newton('beale','grad_beale','hess_beale',x04,dt,eps);

disp('BFGS with x01 = [2 ; 3]:');
xs_bf_01 = bfgs('beale','grad_beale',x01,eps);
disp('BFGS with x02 = [-3 ; 3]:');
xs_bf_02 = bfgs('beale','grad_beale',x02,eps);
disp('BFGS with x03 = [2 ; -3]:');
xs_bf_03 = bfgs('beale','grad_beale',x03,eps);
disp('BFGS with x04 = [-3 ; -3]:');
xs_bf_04 = bfgs('beale','grad_beale',x04,eps);

x1 = -5:0.01:5;
x2 = -5:0.01:5;
[X1,X2] = meshgrid(x1, x2);

for i=1:length(x1)
    for j=1:length(x2)
        Z(i,j) = log(beale([x1(i);x2(j)]));
    end
end

[xs,k] = grad_desc_path('beale','grad_beale',x04,eps);
ax = [-5 5 -5 5];

figure;
hold on;
contour(X1,X2,Z, 200);
plot(xs_gd_01(2, :), xs_gd_01(1, :), 'ro-');
plot(xs_gd_02(2, :), xs_gd_02(1, :), 'bo-');
plot(xs_gd_03(2, :), xs_gd_03(1, :), 'go-');
plot(xs_gd_04(2, :), xs_gd_04(1, :), 'mo-');
axis(ax);
title('Gradient Descent paths');
hold off;

figure;
hold on;
contour(X1,X2,Z, 200);
plot(xs_nt_01(2, :), xs_nt_01(1, :), 'ro-');
plot(xs_nt_02(2, :), xs_nt_02(1, :), 'bo-');
plot(xs_nt_03(2, :), xs_nt_03(1, :), 'go-');
plot(xs_nt_04(2, :), xs_nt_04(1, :), 'mo-');
axis(ax);
title('Newton paths');
hold off;

figure;
hold on;
contour(X1,X2,Z, 200);
plot(xs_bf_01(2, :), xs_bf_01(1, :), 'ro-');
plot(xs_bf_02(2, :), xs_bf_02(1, :), 'bo-');
plot(xs_bf_03(2, :), xs_bf_03(1, :), 'go-');
plot(xs_bf_04(2, :), xs_bf_04(1, :), 'mo-');
axis(ax);
title('BFGS paths');
hold off;