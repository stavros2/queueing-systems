clc;
clear all;
close all;

# orizete to sistima kai i arxiki katastasi tou
lambda = 5;
mu = 10;
states = [0, 1, 2, 3, 4];
initial_state = [1, 0, 0, 0, 0];

genniseis = [lambda, lambda/2, lambda/3, lambda/4];
thanatoi = [mu, mu, mu, mu];

# ipologismos kai tipoma tou metavatikou pinaka
metavatikos = ctmcbd(genniseis, thanatoi);

disp("The transition matrix of the system is:");
display (metavatikos);

# ipologismos kai tipoma ergodikon pithanotiton
ergodic_prob = ctmc(metavatikos);

disp("The ergodic probabilities of the system are (for each state):");
display(ergodic_prob);

# ipologismos kai tipoma mesou arithmou pelaton sto sistima
avg_customers = ergodic_prob(2) + 2 * ergodic_prob(3) + 3 * ergodic_prob(4) + 4 * ergodic_prob(5);
disp("The average number of customers in the system is "), disp (avg_customers);

# ipologismos kai tipoma pithanotitas blockarismatos
pblock = ergodic_prob(5);
display("The blocking probability of the system is "), disp(pblock);

# ipologismos kai parousiasi ton diagrammaton ekseliksis ton pithanotiton gia kathe katastasi ksexorista
index = 0;
for T = 0:0.01:50
  index = index + 1;
  pithanotita = ctmc(metavatikos, T, initial_state);
  Prob0(:,index) = pithanotita;
  if (pithanotita - ergodic_prob < 0.01)
    break;
  endif
endfor
T = 0:0.01:T;

figure (1)
for i = 1:1:5
  subplot (3, 2, i);
  plot(T,Prob0(i,:),"r","linewidth",1.3);
  ttlstring = strcat("Probability changes over time for state ", num2str(i-1)); 
  title(ttlstring);
  xlabel("Time");
  ylabel("Probability");
  grid on;
endfor
 