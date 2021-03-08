
close all;
clear all;
clc;

load ramp_curr;
ramp_targ = 0:0.5:49.5;

err = ramp_targ - ramp_curr';

t = 0:0.05:(5 - 0.05);

plot(t,ramp_targ, 'b', t, ramp_curr, 'r', t, err, 'c');
legend('Target', 'Response', 'Error', 'location', 'northwest');
xlabel('Time (sec)');
ylabel('Position (Degrees)');
title('Target Ramp Response');
grid on;
grid minor;

