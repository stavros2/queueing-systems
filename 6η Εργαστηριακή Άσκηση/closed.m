clc;
clear all;
close all;

mu1 = 2;
mu2 = 3;
mu3 = 4;
p = 0.4;

arrivals(200) = 0;
arrivals(110) = 0;
arrivals(101) = 0;
arrivals(20) = 0;
arrivals(11) = 0;
arrivals(2) = 0;
total_arrivals = 0;
times = 0;
steps = 0;
sigklisi = false;

threshold0 = p*mu1/ (mu1+ mu2 + mu3);
threshold1 = mu1 / (mu1 + mu2 + mu3);
threshold2 = (mu1 + mu2) / (mu1 + mu2 + mu3);

prev_mean1 = 0;
prev_mean2 = 0;
prev_mean3 = 0;

current_state = 200;

while !sigklisi && steps <= 300000
  steps = steps + 1;
  arrivals(current_state) = arrivals(current_state) + 1;
  total_arrivals = total_arrivals + 1;
  decision = rand(1);
  
  if (current_state == 200 && decision < threshold0)
    current_state = 110;
  elseif (current_state == 200 && decision > threshold0 && decision < threshold1)
    current_state = 101;
  elseif (current_state == 110 && decision < threshold0) 
    current_state = 20;
  elseif (current_state == 110 && decision > threshold0 && decision < threshold1)
    current_state = 11;
  elseif (current_state == 110 && decision < threshold2 && decision > threshold1)
    current_state = 200;
  elseif (current_state == 101 && decision < threshold0)
    current_state = 11;
  elseif (current_state == 101 && decision > threshold0 && decision < threshold1)
    current_state = 2;
  elseif (current_state == 101 && decision > threshold2)
    current_state = 200;
  elseif (current_state == 20 && decision > threshold1 && decision < threshold2)
    current_state = 110;
  elseif (current_state == 11 && decision > threshold2)
    current_state = 110;
  elseif (current_state == 11 && decision > threshold1 && decision < threshold2)
    current_state = 101;
  elseif (current_state == 2 && decision > threshold2)
    current_state = 101;
  else
    arrivals(current_state) = arrivals(current_state) - 1;
    total_arrivals = total_arrivals - 1;
  endif
  
  if mod(steps, 1000) == 0
    times = times + 1;
    
    T200 = 1 / mu1 * arrivals(200);
    T110 = 1 / (mu1 + mu2) * arrivals(110);
    T101 = 1 / (mu1 + mu3) * arrivals(101);
    T20 = 1 / mu2 * arrivals(20);
    T11 = 1 / (mu2 + mu3) * arrivals(11);
    T2 = 1 / mu3 * arrivals(2);
    
    total_time = T200 + T110 + T101 + T20 + T11 + T2;
    P(2) = T2 / total_time;
    P(11) = T11 / total_time;
    P(20) = T20 / total_time;
    P(101) = T101 / total_time;
    P(110) = T110 / total_time;
    P(200) = T200 / total_time;
    
    current_mean1 = P(101) + P(110) + 2 * P(200);
    current_mean2 = P(11) + 2 * P(20) + P(110);
    current_mean3 = 2 * P(2) + P(11) + P(101);
    
    clients1(times) = current_mean1;
    clients2(times) = current_mean2;
    clients3(times) = current_mean3;
    
    if abs(current_mean1 - prev_mean1) < 0.00001 && abs(current_mean2 - prev_mean2) < 0.00001 && abs(current_mean3 - prev_mean3) < 0.00001
      sigklisi = true;
    endif
    
    prev_mean1 = current_mean1;
    prev_mean2 = current_mean2;
    prev_mean3 = current_mean3;
  endif
endwhile

total_steps = 1:1:times;

disp(cstrcat("The probability for state (2,0,0) is ", num2str(P(200))));
disp(cstrcat("The probability for state (1,1,0) is ", num2str(P(110))));
disp(cstrcat("The probability for state (1,0,1) is ", num2str(P(101))));
disp(cstrcat("The probability for state (0,2,0) is ", num2str(P(20))));
disp(cstrcat("The probability for state (0,1,1) is ", num2str(P(11))));
disp(cstrcat("The probability for state (0,0,2) is ", num2str(P(2))));


figure(1);
hold on;
plot(total_steps, clients1, 'r');
plot(total_steps, clients2, 'g');
plot(total_steps, clients3, 'b');
hold off;
title("Average number of clients for each queue in the system");
xlabel("Transitions in Thousands");
ylabel("Average Number of Clients for each Queue");
legend("Queue 1", "Queue 2", "Queue 3");
legend("show");

    
    
    
      
      
    