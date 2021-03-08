
clear all;
close all;
clc;

load step;

x = 0:0.02:1.98;
u = 45*ones(length(step));
err = (u - step);
plot(x, step, 'r', x, u, 'b', x, err, 'g');
axis([0 2 -10 60]);
xlabel('Time (s)');
ylabel('Pitch (degrees)');
title('Target step response (pitch, 45 degree step)');
legend('Pitch Response', 'Set-point (target)', 'Error', 'location', 'southeast');
grid on;
grid minor;