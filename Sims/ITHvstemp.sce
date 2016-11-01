

temp=25;
Ithfgpmos_1=510e-9./(temp+273)^0.5
Ithnmos_1=69.65e-9./(temp+273)^0.5//5.438e-8./(temp+273)^0.5
temp=linspace(-100,500,13)
Ithfgpmos=Ithfgpmos_1*(temp+273)^0.5
Ithnmos=Ithnmos_1*(temp+273)^0.5
figure();plot(temp,Ithfgpmos./Ithnmos)
