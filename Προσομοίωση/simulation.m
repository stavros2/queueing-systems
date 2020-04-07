clc;
clear all;
close all;

mu = 8;
figure_count = 1;
prob = 0.5;

% montelopoioume to sistima. Oi katastaseis einai k + 9. Exoume ti xrisi enos tixaiou arithmou\


for lambda = 6:1:8
  for k = 3:1:6
    % exoume sinolika 12 epanalipseis, arxikopoioume oles tis metavlites pou xreiazomaste
    rand("seed",1234); % to idio seed se kathe ipo-prosomiosi gia na mporoume na elegksoume tin taxitita sigklisis
    clear to_plot;
    index = 0;
    transitions = 0;
    sigklisi = 0;
    total_arrivals = 0;
    P = zeros(1, k + 9);
    arrivals = zeros(1, k + 9); 
    cur_state = 1;
    prev_mean = 0;
    threshold0 = lambda / (lambda + mu);
    threshold1 = lambda / (lambda + 2 * mu);
    threshold2 = (lambda + mu) / (lambda + 2 * mu);
    threshold3 = threshold0 * prob;
    while !sigklisi
      transitions++;
      decision = rand(1);
      if cur_state == 1 
        arrivals(1)++;
        total_arrivals++;
        cur_state++;
      elseif (cur_state == k) && (decision > threshold0)
        cur_state--;
      elseif (cur_state == k) && (decision < threshold3)
        arrivals(cur_state)++;
        total_arrivals++;
        cur_state++;
      elseif (cur_state == k) && (decision > threshold3) && (decision < threshold0)
        arrivals(cur_state)++;
        total_arrivals++;
        cur_state = k + 9;
      elseif (cur_state == k + 2) && (decision < threshold1)
        arrivals(cur_state)++;
        total_arrivals++;
        cur_state++;
      elseif (cur_state == k + 2) && (decision > threshold1) && (decision < (lambda + prob * mu) / (lambda + 2 * mu))  
        cur_state--;
      elseif (cur_state == k + 2) && (decision > (lambda + prob * mu) / (lambda + 2 * mu))
        cur_state = k + 9;
      elseif (cur_state == 9) && (decision < threshold1)
        arrivals(cur_state)++;
        total_arrivals++;
      elseif (cur_state == 9) && (decision > threshold1)
        cur_state--;
      elseif (cur_state == k + 9) && (decision < threshold1)
        total_arrivals++;
        arrivals(cur_state)++;
        cur_state = k + 2;
      elseif (cur_state == k + 9) && (decision > threshold1) && (decision < threshold2)
        cur_state = k;
      elseif (cur_state == k + 9) && (decision > threshold2)
        cur_state--;
      elseif (cur_state == 10) && (decision < threshold0)
        total_arrivals++;
        arrivals(cur_state)++;
        cur_state++;
      elseif (cur_state == 10) && (decision > threshold0)
        cur_state = 1;
      elseif (cur_state == k + 1) && (decision < threshold0)
        arrivals(cur_state)++;
        total_arrivals++;
        cur_state++;
      elseif (cur_state == k + 1) && (decision > threshold0)
        cur_state--;
      elseif (cur_state < k) && (decision < threshold0)
        arrivals(cur_state)++;
        total_arrivals++;
        cur_state++;
      elseif (cur_state < k) && (decision > threshold0)
        cur_state--;
      elseif (cur_state < 9) && (decision < threshold1)
        arrivals(cur_state)++;
        total_arrivals++;
        cur_state++;
      elseif (cur_state < 9) && (decision > threshold1)
        cur_state--;
      elseif (cur_state > 10) && (decision < threshold1)
        total_arrivals++;
        arrivals(cur_state)++;
        cur_state++;
      elseif (cur_state > 10) && (decision > threshold1) &&(decision < threshold2)
        cur_state -= 9;
      elseif (cur_state > 10) && (decision > threshold2)
        cur_state--;
      endif

% kathe  1000 metavaseis elegxoume gia sigklisi      
      if mod(transitions,1000) == 0
        index++;
        
        for i=1:1:length(arrivals)
          P(i) = arrivals(i) ./ total_arrivals;
        endfor
        
        mean_clients = 0;
        for i=1:1:9
          mean_clients += P(i) .* (i - 1);
        endfor
        for i = 10:1:length(arrivals)
          mean_clients += P(i) .* (i - 9);
        endfor
        to_plot(index) = mean_clients;
        if abs(mean_clients - prev_mean) < 0.000001
          sigklisi = 1;
        endif
        
        prev_mean = mean_clients;
      endif
    endwhile
    
% ipologizoume ta throughput kai parousiazoume ta apotelesmata mas gia kathe sindiasmo lambda kai k
    utilA = 1 - P(1) - P(10);
    utilB = 1;
    for i = 1:1:k+1
      utilB -= P(i);
    endfor
    tptA = utilA * mu;
    tptB = utilB * mu;
    logos = tptA / tptB;
    disp(cstrcat("For k = ", num2str(k), " and lambda = ", num2str(lambda), " ThroughputA/ThroughputB is ", num2str(logos)));
    title_str = cstrcat("Average Number of Clients for k = ", num2str(k), " and lambda = ", num2str(lambda));
    disp(cstrcat(title_str, " is ", num2str(mean_clients)));
    figure(figure_count++);
    plot(to_plot);
    grid on;
    title(title_str);
    ylim([0 mean_clients+0.5]);
    xlabel("Transitions in Thousands");
    ylabel("Mean Clients");
  endfor
endfor
