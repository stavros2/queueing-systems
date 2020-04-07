clc;
clear all;
close all;

# orizete to sistima kai i arxiki katastasi tou
lambda = 3;
mu = 1;
states = [0, 1, 2, 3, 4, 5];
initial_state = [1, 0, 0, 0, 0, 0];

genniseis = [lambda, lambda, lambda, lambda, lambda];
thanatoi = [2, 3, 4, 5, 6];

# ipologismos kai tipoma tou metavatikou pinaka
metavatikos = ctmcbd(genniseis, thanatoi);
# ipologismos kai tipoma ergodikon pithanotiton
ergodic_prob = ctmc(metavatikos);

disp("The ergodic probabilities of the system are (for each state):");
display(ergodic_prob);

# ipologismos kai tipoma mesou arithmou pelaton sto sistima
avg_customers = ergodic_prob(2) + 2 * ergodic_prob(3) + 3 * ergodic_prob(4) + 4 * ergodic_prob(5) + 5 * ergodic_prob(6);
disp("The average number of customers in the system is "), disp (avg_customers);
