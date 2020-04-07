clc;
clear all;
close all;

X = [1 0.6];
M = 2;
util1 = zeros(1,20);
util2 = zeros(1,20);
clients1 = zeros(1,20);
clients2 = zeros(1,20);
for N = 1:1:20
  [A B] = buzen(N, M, X);
  util1(N) = X(1) * A(N) / A(N+1);
  util2(N) = X(2) * A(N) / A(N+1);
  for k = 1:1:N
    clients1(N) = clients1(N) + X(1) ** k * A(N+1-k) / A(N+1);
    clients2(N) = clients2(N) + X(2) ** k * A(N+1-k) / A(N+1);
  endfor
endfor

N = 1:1:20;

figure(1);
hold on;
plot(N, util1, 'r');
plot(N, util2, 'g');
hold off;
grid on;
title("Utilization for eache queue as a function of total number of clients");
xlabel("Total Number of Clients");
ylabel("Utilization");
legend("Queue 1" , "Queue 2");
legend("show");

figure(2);
hold on;
plot(N, clients1, 'r');
plot(N, clients2, 'g');
hold off;
grid on;
title("Average number of clients for each queue as a function of total number of clients");
xlabel("Total Number of Clients");
ylabel("Average Number of Clients for Queue");
legend("Queue 1", "Queue 2");
legend("show");