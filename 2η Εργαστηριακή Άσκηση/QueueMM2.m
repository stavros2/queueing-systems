clc;
clear all;
close all;

lambda = 10;
mu = 10;

# prosomiosi ouras M/M/2
[utilization2, waiting_time2] = qsmmm (lambda, mu, 2); 

# prosomiosi 2 parallilon ouron M/M/1
[utilization, waiting_time] = qsmm1 (0.5*lambda, mu);

disp("The average waiting time for M/M/2 is "), disp(waiting_time2);
disp("The average waiting time for 2 parallel M/M/1 is "), disp(waiting_time);