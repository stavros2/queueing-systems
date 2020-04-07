clc;
clear all;
close all;

state1b = 0;
state1a = 0;
total_arrivals = 0;
current_state = 0; 
previous_mean_clients = 0; 
sigklisi = false;
transitions = 0;
arrivals = zeros(1, 4);
P = zeros(1, 4);



while transitions <= 300000 && !sigklisi
  decision = rand(1);
  transitions = transitions + 1;
  if current_state == 0 
    total_arrivals = total_arrivals + 1;
    current_state = 1;
    arrivals(1) = arrivals(1) + 1;
    state1a = 1;
  elseif state1a && (decision < 1 / 2.2)
    total_arrivals = total_arrivals + 1;
    current_state = 2;
    arrivals(2) = arrivals(2) + 1;
    state1a = 0;
  elseif state1a && (decision > 1 / 2.2) && (decision < 1.8 / 2.2)
    current_state = 0;
    state1a = 0;
  elseif state1b && (decision < 1 / 2.2)
    total_arrivals = total_arrivals + 1;
    current_state = 2;
    arrivals(3) = arrivals(3) + 1;
    state1b = 0;
  elseif state1b && (decision > 1.8 / 2.2)
    current_state = 0;
    state1b = 0;
  elseif (current_state == 2) && (decision < 1 / 2.2)
    total_arrivals = total_arrivals + 1;
    arrivals(4) = arrivals(4) + 1;
  elseif (current_state == 2) && (decision > 1.8 / 2.2)
    current_state = 1;
    state1a = 1;
  elseif (current_state == 2) && (decision > 1 / 2.2) && (decision < 1.8 / 2.2)
    current_state = 1;
    state1b = 1;
  endif
  
  if mod(transitions, 1000) == 0
    for i = 1:1:4
      P(i) = arrivals(i)/total_arrivals;
    endfor
    mean_clients = P(2) + P(3) + 2 * P(4);
    
    if abs(mean_clients - previous_mean_clients) < 0.00001
      sigklisi = true;
    endif
    previous_mean_clients = mean_clients;
  endif
endwhile

disp("The ergodic probabilities of the system are (P0, P1a, P1b, P2):");
disp(P);
disp(cstrcat("The blocking probability of the system is ", num2str(P(4))));
disp(cstrcat("The average number of clients in the system is ", num2str(mean_clients)));