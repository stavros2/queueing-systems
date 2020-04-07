clc
clear all;
close all;

xronoi = exprnd(0.2, 1, 100);			# dimiourgia 100 tixaion deigmaton ekthetikis katanomis me lambda=5;
time_skala = zeros (1, 101);
skala = 0:1:100;				# aksonas me katastaseis tou sistimatos

for i = 1:100
  time_skala(i+1) = time_skala(i) + xronoi (i);		# aksonas tou xronou
endfor 
 
figure(1);
stairs (time_skala, skala);
grid on;
title("Poisson Counting Proccess");
xlabel("Time(s)");
ylabel("Count of Events");
 
mesos_oros = 100/time_skala(101);			# o mesos oros gegonoton einai isos me ola ta gegonota (=100) / to sinoliko xrono (=telefteos xronos-0)
disp("Average number of events per time unit = "), disp(mesos_oros);
 
sum1=0;
sum2=0;
for i = 1:100
  tixaia = exprnd(0.2, 1, 100);
  sum1 = sum1 + tixaia(50);
  sum2 = sum2 + tixaia(51);
endfor
sum1 = sum1 / 100;		# ipologismos meson oron
sum2 = sum2 / 100;
disp("The average time between events 49 and 50 = "), disp(sum1);
disp("The average time between events 50 and 51 = "), disp(sum2);

