
% ECE 403 Lab 3
% Author: Noah Rondeau

load D_build_tr.mat
load D_build_te.mat

% ======================================================================= %
% TRAINING
% ======================================================================= %

% format training data
Xtr = D_build_tr(1:8,:);
Ytr = D_build_tr(9:10,:);

X_hat = [Xtr' ones(640, 1)];
Y_hat = Ytr';

W_hat = pinv(X_hat)*Y_hat;
W = W_hat(1:8, :);
b = W_hat(9, :)';

% ======================================================================= %
% TESTING
% ======================================================================= %

% format testing data
Xte = D_build_te(1:8,:);
Yte = D_build_te(9:10,:);

% predict values
Yp = W' * Xte + b;

% calculate overal relative error
ep = norm(Yte - Yp, 'fro') / norm(Yte, 'fro');

fprintf('============= RESULTS ==============\n');
fprintf('Overall relative error = %f percent \n', 100*ep);

figure(1);
hold on;
axis([0 140 0 45]);
plot(1:128, Yte(1,:), 'b');
plot(1:128, Yp(1,:), 'r');
title('Comparison of true and predicted Y(1) (heating load)');
legend('True labels', 'Predicted labels', 'Location', 'northwest');
xlabel('Sample index');
ylabel('Magnitude');
hold off;

figure(2);
hold on;
axis([0 140 0 45]);
plot(1:128, Yte(2,:), 'b');
plot(1:128, Yp(2,:), 'r');
title('Comparison of true and predicted Y(2) (cooling load)');
legend('True labels', 'Predicted labels', 'Location', 'northwest');
xlabel('Sample index');
ylabel('Magnitude');
hold off;

fprintf('\n\n');



