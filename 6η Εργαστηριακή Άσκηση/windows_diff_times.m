clc; 
clear all;
close all;

Prob = [0 1 0 0 0; 0 0 1 0 0; 0 0 0 1 0; 0 0 0 0 1; 1 0 0 0 0];  

V = qncsvisits(Prob);
S = [1 0.5 0.5 0.5 3/2];
m = [1 1 1 1 1];

usage = zeros(5,5);
waiting_time = zeros(5,5);
avg_clients = zeros(5,5);
gamma = zeros(5,5);


for k = 1:1:5
  myS = k * S;
  [usage(k,:) waiting_time(k,:) avg_clients(k,:) gamma(k,:)] = qnclosed(8, myS, V, m);
endfor

display(usage);
display(waiting_time);
display(avg_clients);
display(gamma);
