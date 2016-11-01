//importXcosDiagram("./Peak_detect.xcos")
cd /home/ubuntu/RASP_Workspace/Class/Sims 
importXcosDiagram("./pmos_ekv_sim.xcos")
function btn = messagebox(msg, msgboxtitle, msgboxicon, buttons,ismodal) 
    btn = 0; 
endfunction 
Ith_pmos_1=4.105D-08  //3.63e-8//5.84e-08;// 4.302D-08 ./(temp+273)^0.5

//t=0:1e-6:0.01;
//V.time=t';
//V.values=1.8 + 0.2*(sin(2*3.14*1000*t'))
//myVariable=0.8

temp=25;
K=1.38064852e-23;
q=1.60217662e-19;


Ith_pmos_1=Ith_pmos_1./(temp+273)^0.5

typeof(scs_m) 
scs_m.props.context


//Vtpmos_1=0.613*(K*(temp+273)./q);
Ut1=(K*(25+273)./q)
Ut2=(K*(30+273)./q)

Vt1= 0.6570805  //0.6616
Vt2=0.6531138//0.653
A2=(Vt1 - Vt2)./(Ut1-Ut2)
A1=Vt1 -(A2*Ut1)



i_loop=1;
clear PMOS_current
temp=-10;
while i_loop<14
    
    Ut=K*(temp+273)./q;
    
Vt(i_loop)=A1 + A2 *(Ut)    
Vtpmos=A1 + A2 *(Ut)
//Vtpmos=0.6616
Ith_pmos=Ith_pmos_1*(temp+273)^0.5

importXcosDiagram("./pmos_ekv_sim.xcos")
scs_m.props.context
INFO=xcos_simulate(scs_m, 4);
PMOS_current(:,1)=Input_pmos.values
PMOS_current(:,i_loop+1)=Output_pmos.values
//myVariable=myVariable+0.01;
sleep(5)
i_loop=i_loop+1;
temp=temp+5;
end
//myVariable=0.8:0.01:0.9;
temp=linspace(-10,50,13)
figure();
plot2d('nl',PMOS_current(:,1),PMOS_current(:,2:3))
 p = get("hdl"); p.children.mark_mode = "on"; p.children.mark_style = 9; p.children.thickness = 3; 
Measure_pmos=csvRead('./PFET_temp.csv')
plot2d('nl',Input_pmos.values,Measure_pmos(:,2:3))
p = get("hdl"); p.children.mark_mode = "on"; p.children.mark_style = 1; p.children.thickness = 3;
// 
// 
//plot2d('nl',Input_pmos.values,Measure_pmos(:,2))
// p = get("hdl"); p.children.mark_mode = "on"; p.children.mark_style = 1; p.children.thickness = 3;
//////
//plot2d('nl',Input_pmos.values,Measure_pmos(:,$))
// p = get("hdl"); p.children.mark_mode = "on"; p.children.mark_style = 1; p.children.thickness = 3;
//////


//csvWrite(PMOS_current,'./PMOS_EKV_current.csv')
