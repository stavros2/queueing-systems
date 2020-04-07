clc;
clear all;
close all;

blocking_prob = zeros(1, 200);
rho = 76.66667;
c = 1:1:200;


#calculating the blocking probabilities
for i = 1:1:200;
  blocking_prob(i) = erlangb_iterative(rho, i);
endfor

#finding the first probability less than 1%
for i = 1:1:200
  if blocking_prob(i) < 0.01 
    this_value = i;
    break;
  endif
endfor

disp(cstrcat("We want ", num2str(i), " servers for a probability less than 1%. The probability is ", num2str(blocking_prob(i))));
disp(cstrcat("The probability for ", num2str(i-1), " servers is ", num2str(blocking_prob(i-1))));
figure(1);
plot(c, blocking_prob, 'r');
grid on;
title("Blocking Probability as a function of servers available");
xlabel("Available Servers");
ylabel("Blocking Probability");
