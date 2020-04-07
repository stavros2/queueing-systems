clc;
clear all;
close all;

lambda = [3, 3, 3, 3, 3];
mu = [2, 3, 4, 5, 6];
threshold = [1, 3/5, 3/6, 3/7, 3/8, 3/9, 0];
metavaseis = zeros (1, 8);
sfalma = zeros (1,8);

for j = 1:1:8  
  clear arrivals;
  clear P;
  total_arrivals = 0;   # initializing values for every loop
  current_state = 0; 
  previous_mean_clients = 0; 
  sigklisi = false;
  transitions = 0;        
  while !sigklisi
      
      decision = rand (1);      # generationg a random number between 0 and 1
      transitions = transitions + 1; 
      
      # the system gets an arrival if it is empty or if the random number is less than
      # the threshold and the system isn't full
      # else it gets a departure
      if decision < threshold(current_state + 1)  
        total_arrivals = total_arrivals + 1;
        try
          arrivals(current_state + 1) = arrivals(current_state + 1) + 1; 
          current_state = current_state + 1;
        catch
          arrivals(current_state + 1) = 1;
          current_state = current_state + 1;
        end_try_catch  
       else
        current_state = current_state - 1;
      endif
      
      # every 1000 events we check for convergence
      if mod(transitions, 1000) == 0
        # calculating possibilites and average number of clients in the system
        for i = 1:1:length(arrivals)
          P(i) = arrivals(i)/total_arrivals;
        endfor
        
        mean_clients = 0;
        for i = 1:1:length(arrivals)
          mean_clients = mean_clients + (i-1) * P(i);
        endfor
        
        # convergence check here
        if abs(mean_clients - previous_mean_clients) < (0.01/(10**(j-1)))
          sigklisi = true;
          metavaseis(j) = transitions; 
          sfalma(j) = abs(mean_clients - 1.9980);     
        endif
        previous_mean_clients = mean_clients;
      endif
      
    endwhile
  endfor


states = 1:1:8;

# plotting the results
figure(1);
subplot(2, 1, 1);
bar(states, sfalma, "r","linewidth",1.3);
grid on;
title("Error");
xlabel("Convergence Value (in 10**(-1-i))");
ylabel("Error Between Theoritical and simulation Value");

subplot(2, 1, 2);
bar(metavaseis, 'r',0.4);
grid on;
title("Transitions");
xlabel("Convergence Value (in 10**(-1-i))");
ylabel("Number of Transitions for Reaching Convergence");