clc;
t=0:(1/2000):0.3;

myVariable=1.25 + 0.3*(sin(2*3.14*100*(t)))
figure();plot(t,myVariable)
