clc;
clear all;
close all;


lambda = 1;
mu = 1/4;
states = 0:1:8;
initial_sate = [1, 0, 0, 0, 0, 0, 0, 0 , 0];   # initial state of the system

genniseis = [lambda, lambda, lambda, lambda, lambda, lambda, lambda, lambda];
thanatoi = [mu, 2*mu, 3*mu, 4*mu, 5*mu, 5*mu, 5*mu, 5*mu];

metavatikos = ctmcbd(genniseis, thanatoi);


ergodic_prob = ctmc(metavatikos);

format short g;
for i = 1:1:9 
  message = cstrcat ("Ergodic probability of state ", num2str(i-1), " is ", num2str(ergodic_prob(i)));
  disp(message);
endfor


P_waiting1 = ergodic_prob(6) + ergodic_prob(7) + ergodic_prob(8) + ergodic_prob(9);
disp(cstrcat("The possibility of every server being busy is ", num2str(P_waiting1)));
P_waiting = erlangc(lambda/mu, 5);
disp(cstrcat("The possibility of every server being busy (for an infinite system) is ", num2str(P_waiting)));