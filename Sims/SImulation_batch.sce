//importXcosDiagram("./Peak_detect.xcos")
cd ~/RASP_Workspace/class_git/trunk/Sims/
importXcosDiagram("./Biasgen.xcos")
function btn = messagebox(msg, msgboxtitle, msgboxicon, buttons,ismodal) 
    btn = 0; 
endfunction 
typeof(scs_m) 
scs_m.props.context

Ithnmos=0.0000825
Ithfgpmos=0.0012708

//t=0:1e-6:0.01;
//V.time=t';
//V.values=1.8 + 0.2*(sin(2*3.14*1000*t'))
//myVariable=0.8
temp=25;
K=1.38064852e-23;
q=1.60217662e-19;

i_loop=1;

temp=-10;
while i_loop<14
    
    Ut=K*(temp+273)./q;

   //Ithnmos=5.438e-8./Ut^2
//Ithfgpmos=8.38e-7./Ut^2
importXcosDiagram("./Biasgen.xcos")
scs_m.props.context
INFO=xcos_simulate(scs_m, 4);
PMOS_voltage(:,i_loop)=mean(Output.values(:,1))
//myVariable=myVariable+0.01;

i_loop=i_loop+1;
temp=temp+5;
end
//myVariable=0.8:0.01:0.9;
temp=linspace(-10,50,13)
//figure();
plot2d(temp,abs(PMOS_voltage(1,:)))
 //p = get("hdl"); p.children.mark_mode = "on"; p.children.mark_style = 9; p.children.thickness = 3; 
Voltage_bias=csvRead('Voltage_Biasgen_temp_trial01.csv')
plot(temp,Voltage_bias,'-o')
