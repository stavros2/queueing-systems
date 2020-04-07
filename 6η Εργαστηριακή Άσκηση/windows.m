clc; 
clear all;
close all;

Prob = [0 1 0 0 0; 0 0 1 0 0; 0 0 0 1 0; 0 0 0 0 1; 1 0 0 0 0];  

V = qncsvisits(Prob);
S = [1 0.5 0.5 0.5 3/2];
m = [1 1 1 1 1];

gamma = zeros(1,8);
tDS = zeros(1,8);

for n = 1:1:8
  [U R Q X] = qnclosed(n, S, V, m);
  gamma(n) = mean(X);
  tDS(n) = (Q(2) + Q(3) + Q(4)) / gamma(n);
endfor

w = 1:1:8;

figure(1);
subplot(3, 1, 1);
scatter(w, gamma);
grid on;
title("Throughput as a function of Window Size");
xlabel("Window Size");
ylabel("Throughput");
xlim([0 8]);
ylim([0 0.8]);

subplot(3, 1, 2);
scatter(w, tDS);
grid on;
title("Average delay time as a function of Window Size");
xlabel("Window Size");
ylabel("Average Delay Time");
xlim([0 8]);
ylim([0 2.5]);

subplot(3, 1, 3);
scatter(gamma, tDS);
grid on;
title("Average delay time as a function of throughput");
xlabel("Throughput");
ylabel("Average Delay Time");
xlim([0 0.8]);
ylim([0 2.5]);