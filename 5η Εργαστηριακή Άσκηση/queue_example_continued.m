clc;
clear all;
close all;


lambda1 = 0.06: 0.006: 5.94;
lambda2 = 1;
mu1 = 6;
mu2 = 5;
mu3 = 8;
mu4 = 7;
mu5 = 6;

for i = 1:1:981
  clients = mean_clients(lambda1(i), lambda2, mu1, mu2, mu3, mu4, mu5);
  waiting_times(i) = sum(clients) / (lambda1(i) + lambda2);
endfor

figure(1);
plot(lambda1, waiting_times);
grid on;
title("Average waiting time as a function of lambda1");
xlabel("Lambda1 Values");
ylabel("Average Waiting Time");