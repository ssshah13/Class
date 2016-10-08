figure();
subplot(211);plot2d(myVariable,out_volt) 
 
 diff_loop=1;
 while diff_loop<length(myVariable)-60;
     
     Slope_CD(diff_loop,1)=abs(out_volt(diff_loop)-out_volt(diff_loop+60))./abs(myVariable(diff_loop)-myVariable(diff_loop+60));
 diff_loop=diff_loop+20;    
end
 Slope_CD(diff_loop,1)= Slope_CD(diff_loop-1,1)
subplot(212);plot2d(myVariable,Slope_CD) 
 
