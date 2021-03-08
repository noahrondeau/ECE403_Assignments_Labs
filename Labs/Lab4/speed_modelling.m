
close all;
clear all;
clc;


load position.txt;
position(1) = 0; % get rid of crazy value


figure;
plot(0:0.01:4.99, position);


f = fir1(101,0.1,'low');
position = filter(f,1,position);
hold on;
plot(0:0.01:4.99, position);
xlabel('Time (s)');
ylabel('Position (degrees)');
title('Position vs time for 45deg/s speed)');
legend('Measured', 'FIR-filtered', 'location', 'southeast');
hold off;

speed = [];

for i=2:500
    speed(i) = (position(i) - position(i - 1)) / 0.01;
end

figure;
plot(0.01:0.01:5, speed);

figure;
f2 = fir1(101, 0.01, 'low');
filterspeed = filter(f2,1,speed);
plot(0.01:0.01:5, filterspeed);

u = zeros(1,length(filterspeed));
start_val = 75;
u(1:start_val) = 0;
u((start_val + 1):end) = 45;

sigma = 3.8;
G = tf([sigma],[1 sigma]);
[y,t] = lsim(G, u, 0.01:0.01:5);
hold on;
plot(t,y);
xlabel('Time (sec)');
ylabel('Speed (degrees/sec)');
title('Step response of motor speed vs time with fitted 1st-order model');
legend('Approximate speed step response (45 degree/sec step)', '1st order fitted model', 'location', 'southeast');

hold off;


figure;
for i=1:500
calcpos(i) = 0.01*sum(filterspeed(1:i));
end
plot(0.01:0.01:5, calcpos);
