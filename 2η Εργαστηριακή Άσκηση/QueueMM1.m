clc;
clear all;
close all;

# orizoume ena dianisma me diafores times tou m apo 5 os 10
# kai tin timi tou lambda = 0
mu = 5.001:0.001:10;    
lambda = 5;

# trexoume tin entoli pou mas dinei ta zitoumena megethi
[utilization, waiting_time, mean_state, throughput] = qsmm1 (lambda, mu);

# pernoume ta diagrammata sinartisi tou m
figure(1);
plot(mu, utilization, 'r');
grid on;
title("Utilization as a function of mu (for lambda = 5)");
xlabel("Mu Values");
ylabel("Utilization");

figure(2);
plot(mu, waiting_time, 'g');
grid on;
title("Waiting time as a function of mu(for lambda = 5)");
xlabel("Mu Values");
ylabel("Waiting time");

figure(3);
plot(mu, mean_state, 'y');
grid on;
title("Average number of customers in the system as a function of mu(for lambda = 5)");
xlabel("Mu Values");
ylabel("Average number of customers");

figure(4);
plot(mu, throughput, 'b');
grid on;
title("Throughput of the system as a function of mu(for lambda = 5)");
xlabel("Mu Values");
ylabel("Throughput");