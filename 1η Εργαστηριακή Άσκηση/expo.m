clc;
clear all;
close all;

# Ftiaxnoume kai parousiazoume tis PDF tis katanomis Poisson me ta dosmena 
# lambda
k = 0:0.0001:8;
lambda = [0.5, 1, 3];

for i = 1 : columns (lambda)
  ekthetikipdf(i,:) = exppdf(k, lambda(i));
endfor  

colors = "rby";
figure(1);
hold on;
for i=1:columns(lambda)
  plot(k,ekthetikipdf(i,:),colors(i),"linewidth",1.2);
endfor
hold off;

title("Probability Density Function of Exponential Processes");
xlabel("k values");
ylabel("Probability");
legend("1/lambda=0.5","1/lambda=1","1/lambda=3");

# Ftiaxnoume kai parousiazoume tis CDF tis katanomis Poisson me ta dosmena
# lambda 
for i = 1 : columns (lambda)
  ekthetikicdf(i,:) = expcdf(k, lambda(i));
endfor


figure(2);
hold on;
for i=1:columns(lambda)
  plot(k,ekthetikicdf(i,:),colors(i),"linewidth",1.2);
endfor
hold off;

title("Cumulative Distribution Function of Exponential Processes");
xlabel("k values");
ylabel("Probability");
legend("1/lambda=0.5","1/lambda=1","1/lambda=3");

# Pernoume 5000 deigmata 2 tixaion metavliton ekthetikis katanomis
x2 = exprnd(2, 1, 5000);
x1 = exprnd(1, 1, 5000);

# Ftiaxnoume ti tm Y=min{x1,x2}
for i = 1 : 5000
  y(i) = min(x1(i), x2(i));
endfor

#ipologizoume to meso oro kai exagoume to istogramma
avg = mean(y);
disp("The mean value is ="), disp(avg);

figure (3);
hold on;
bar (hist(y, 50, 1), 'r', "linewidth", 1.2);
hold off;
title("Normalized Histogram of Y = min {X1,X2}");
