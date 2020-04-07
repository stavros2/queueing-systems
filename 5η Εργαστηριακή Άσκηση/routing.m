clc;
clear all;
close all;


a = 0.001:0.001:0.999;

average_clients1 = (0.65104 * a) ./ (1 - 0.65104 * a);
average_clients2 = (0.81380 * (1 - a)) ./ (1 - (1 - a) * 0.81380);

average_waiting = (average_clients1 + average_clients2) ./ (10**4);

min_time = min(average_waiting);

for i = 1:1:999;
  if min_time == average_waiting(i)
    best_prob = a(i);
    break;
  endif
endfor

disp(cstrcat("The minimum waiting time is ", num2str(min_time), " found for probability a = ", num2str(best_prob)));

figure(1);
plot(a, average_waiting);
grid on;
title("Waiting Time as a Function of a(probabilty of routing through route 1)");
xlabel("Values of a");
ylabel("Average Waiting Time");
