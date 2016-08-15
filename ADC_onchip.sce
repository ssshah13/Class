function [Out,out_volt] = ADC(samples)
    //samples is actually number of shifts
[path,fname,extension] = fileparts(file_name); 
hid_dir = path + '.' + fname;

select board_num 
case 2 then brdtype = '';
case 3 then brdtype = '_30a';
case 4 then brdtype = '_30n';
case 5 then brdtype = '_30h';
else messagebox('Please select the FPAA board that you are using.', "No Selected FPAA Board", "error"); abort;
end

 //exec("~/rasp30/prog_assembly/libs/scilab_code/characterization/char_miteADC.sce",-1);

[a1,b1]=unix_g("sudo ~/rasp30/prog_assembly/libs/sh/asm2ihex.sh ./sftreg_miteADC  ~/RASP_Workspace/ADC_test/Ramp_ADC_DAC.s43 16384 16384 16384")
if b1==1
disp('There is an error in your assembly file')
abort;
end





[a1,b1]=unix_g("sudo tclsh ~/rasp30/prog_assembly/libs/tcl/write_mem2_NoRelease.tcl -start_address 0x4300 -input_file_name "+hid_dir+"/input_vector");
[a2,b2]=unix_g("sudo tclsh ~/rasp30/prog_assembly/libs/tcl/write_mem2_NoRelease.tcl -start_address 0x4200 -input_file_name "+hid_dir+"/output_info");


err=1;
while err==1
[y,err]=unix_g('sudo tclsh ~/rasp30/prog_assembly/libs/tcl/run.tcl '+path+'sftreg_miteADC.elf');
end


//*************************    
    
unix_w("sudo tclsh ~/rasp30/prog_assembly/libs/tcl/read_mem2_NoRelease.tcl -start_address 0x5000 -length 1 -output_file_name "+path+"output_vector.txt");
y = mopen(path+'output_vector.txt','rt')
Output=mgetl(y);
New_output(1,1) = part(Output(1,1),3:7);
Output_dec(1,:) = msscanf(New_output(1,:),'%x'); //scan with hexadecimal format

length_out= Output_dec(1) - 24576;
length_out=length_out/2;
disp(length_out)
unix_w("sudo tclsh ~/rasp30/prog_assembly/libs/tcl/read_mem2_NoRelease.tcl -start_address 0x6000 -length "+string(length_out)+" -output_file_name "+path+"output_vector.txt");
y = mopen(path+"output_vector.txt','rt')
Output=mgetl(y);
m=1
i=3
while m<length_out+1
New_output(m,1) = part(Output(1,1),i:i+3);
m=m+1;
i=i+7;
end
clear Output_dec
m=1
while m<length_out+1
Output_dec(m,:) = msscanf(New_output(m,:),'%x'); //scan with hexadecimal format   
m=m+1;
end
m=1
Out=Output_dec;
out_volt=Out


endfunction
