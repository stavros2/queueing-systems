clc ;
clear all;
close all;

# orizoume ena dianisma me diafores times tou lambda apo 0.1 eos 2.9
# kai tin timi tou mu = 3
mu = 3;    
lambda = 0.1:0.01:2.9;

# trexoume tin 2 sinartiseis gia tis 2 oures
[utilization_md1, waiting_time_md1, mean_state_md1] = qsmd1 (lambda, mu);
[utilization_mm1, waiting_time_mm1, mean_state_mm1] = qsmm1 (lambda, mu);

# pernoume ta diagrammata sinartisi tou rho
figure(1);
subplot (2, 1, 1);
hold on;
plot(lambda/mu, mean_state_md1, 'r');
plot(lambda/mu, mean_state_mm1, 'g');
hold off;
grid on;
title("Average number of customers in the system as a function of rho");
xlabel("Rho Values");
ylabel("Utilization");
legend("M/D/1","M/M/1");
legend("show");

subplot(2, 1, 2);
hold on;
plot(lambda/mu, waiting_time_md1, 'r');
plot(lambda/mu, waiting_time_mm1, 'g');
hold off;
grid on;
title("Waiting time as a function of rho");
xlabel("Rho Values");
ylabel("Waiting time");
legend("M/D/1","M/M/1");
legend("show");