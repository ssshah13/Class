clc;
t=0:1e-6:0.01;
V.time=t';
V.values=1.25 + 0.5*(sin(2*3.14*1000*t'))
//V.values=linspace(0,2.5,51);
V.values=V.values'
figure();plot(V.time,V.values)
