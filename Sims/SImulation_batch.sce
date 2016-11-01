//importXcosDiagram("./Peak_detect.xcos")
cd /home/ubuntu/RASP_Workspace/Class/Sims 
importXcosDiagram("./Biasgen.xcos")
function btn = messagebox(msg, msgboxtitle, msgboxicon, buttons,ismodal) 
    btn = 0; 
endfunction 


temp=27;
K=1.38064852e-23;
q=1.60217662e-19;

Ithnmos_1=60.65e-9./(temp+273)^0.5//5.438e-8./(temp+273)^0.5
Ithfgpmos_1=90e-9./(temp+273)^0.5

temp=25;
K=1.38064852e-23;
q=1.60217662e-19;

typeof(scs_m) 
scs_m.props.context

Ut1=(K*(25+273)./q)
Ut2=(K*(30+273)./q)
Vt1=0.6482// 0.868  //0.6616
Vt2=0.6282/// 0.860  //0.653
A2_fg= (Vt1 - Vt2)./(Ut1-Ut2)
A1_fg=Vt1 -(A2_fg*Ut1)
Vtfgpmos_1=A1_fg + A2_fg*Ut1

Vt1= 0.42//0.6616
Vt2=0.419//0.653
A2_nmos=(Vt1 - Vt2)./(Ut1-Ut2)
A1_nmos=Vt1 -(A2_nmos*Ut1)
Vtfgpmos_1=A1_nmos + A2_nmos*Ut1


//Vtfgpmos_1=0.86574*(K*(temp+273)./q);
//Vtnmos_1=0.3127174*(K*(temp+273)./q);
//
alpha=1500/1e6
i_loop=1;

temp=-10;
while i_loop<14
    
    Ut=K*(temp+273)./q;
Ithnmos=Ithnmos_1*(temp+273)^0.5   
Ithfgpmos=Ithfgpmos_1*(temp+273)^0.5   
    
Vtfgpmos=A1_fg + A2_fg*Ut
Vtnmos=A1_nmos + A2_nmos*Ut 
R=10.07e6 * (1+alpha*(temp-25))


importXcosDiagram("./Biasgen.xcos")
scs_m.props.context
INFO=xcos_simulate(scs_m, 4);
PMOS_voltage(:,i_loop)=mean(Output.values(100:$,1))
Bias_Vref(:,i_loop)=mean(Vref.values(100:$,1))


i_loop=i_loop+1;
temp=temp+5;
end
//myVariable=0.8:0.01:0.9;
temp=linspace(-10,50,13)
figure();
plot(temp,abs(PMOS_voltage(1,:)),'-r')
figure()
plot(temp,abs(Bias_Vref(1,:)),'-r')
 //p = get("hdl"); p.children.mark_mode = "on"; p.children.mark_style = 9; p.children.thickness = 3; 
//Voltage_bias=csvRead('Voltage_Biasgen_temp_trial01.csv')
//figure();plot(temp,Voltage_bias,'-x')
//Voltage_bias1=csvRead('Voltage_Biasgen_temp_trial04.csv')
//plot(temp,Voltage_bias1,'o')
