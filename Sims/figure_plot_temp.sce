i_loop=1
//clear pfet_VT
//clear pfet_Is
//clear pfet_kappa
temp=linspace(-10,50,13)

figure();
current_temp=csvRead('data_pFET_IdVg_01.csv')
//length_volt=size(Gain_biasgen)
//T=(1./40e3)
//time=linspace(0,(length_volt(1,1)-1)*T,(length_volt(1,1)))
while i_loop<12
    
    //plot2d('nl',nFET_IdVg(:,1),nFET_IdVg(:,i_loop+1))
    //scf(1);clf(1);

plot2d('nl',current_temp(:,1),current_temp(:,i_loop+1));p = get("hdl"); p.children.mark_style =i_loop; p.children.thickness = 1; p.children.line_mode="on";p.children.mark_foreground=1;
//plot2d(temp,Voltage_Temp);p = get("hdl"); p.children.mark_style =9; p.children.thickness = 1; p.children.line_mode="on";p.children.mark_foreground=1;
//plot2d(current_temp_bias(:,i_loop));p = get("hdl"); p.children.mark_style =i_loop; p.children.thickness = 1; p.children.line_mode="on";p.children.mark_foreground=1;
//plot2d(time,Voltage_Temp_wobiasgen(:,i_loop));p = get("hdl"); p.children.mark_style =i_loop; p.children.thickness = 1; p.children.line_mode="on";p.children.mark_foreground=1;
//plot2d(time,Voltage_Temp_biasgen(:,i_loop));p = get("hdl"); p.children.mark_style =i_loop; p.children.thickness = 1; p.children.line_mode="on";p.children.mark_foreground=1;
//Output(:,i_loop)=Voltage_Temp_biasgen(:,i_loop)-mean(Voltage_Temp_biasgen(:,i_loop))

//plot2d(time,Output(:,i_loop));p = get("hdl"); p.children.mark_style =i_loop; p.children.thickness = 1; p.children.line_mode="on";p.children.mark_foreground=1;
//plot2d('ln',f0,Gain_biasgen(:,i_loop));p = get("hdl"); p.children.mark_style =i_loop; p.children.thickness = 1; p.children.line_mode="on";p.children.mark_foreground=1;


a=gca();//a.data_bounds=[0 -0.4; (length_volt(1,1)-1)*T 0.4];
//xtitle("","Temp","Bias voltage(V)");
//xtitle("","Vmm number","Current VMM(A)");

//clear pfet_iv
//pfet_iv(:,1)=nFET_IdVg(4:100,1);
//pfet_iv(:,2)=nFET_IdVg(4:100,i_loop+1);

//clear pfet_iv_flip
////pfet_iv_flip=flipdim(pfet_iv,1);
//pfet_iv_flip=pfet_iv
//pfet_iv_flip(:,1)=2.5 - pfet_iv_flip(:,1);
//plotting="off";  // "on_final" or "off"


//epsilon=0.0005; // epsilon=0.005;
//[pfet_Is(i_loop,1), pfet_VT(i_loop,1), pfet_kappa(i_loop,1)]=ekvfit_nfet(pfet_iv_flip(:,1), pfet_iv_flip(:,2), epsilon, plotting);


  i_loop=i_loop+1;
end
legend('-10','-5','0','5','10','15','20','25','30','35','40','45','50')
//EKV(:,1)=pfet_Is
//
//EKV(:,2)=pfet_VT
//
//EKV(:,3)=pfet_kappa
//csvWrite(EKV,'./DAta/EKV.csv')


//scf(2);clf(2);
//plot2d("nn", temp', pfet_VT);p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="on";p.children.mark_foreground=1;
//
//a=gca();a.data_bounds=[-10 0.8; 50 0.5];
//xtitle("","Temp(C)","Vt (V)");
