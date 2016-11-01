clc;
t=0:(1/2000):1.5;
f0=logspace(0.1,2,length(t))
myVariable=1 + 0.1.*(sin(2*3.14.*f0.*(t)))
figure();plot(t,myVariable)
