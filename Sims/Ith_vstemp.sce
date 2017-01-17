
nFET_IdVg=csvRead('PFET_temp.csv')
K=1.38064852e-23;
q=1.60217662e-19;

//nFET_IdVg=PMOS_current
exec('/home/ubuntu/rasp30/prog_assembly/libs/scilab_code/linefit.sce', -1)
exec('/home/ubuntu/rasp30/prog_assembly/libs/scilab_code/ekvfit_nfet.sce', -1)
  nFET_IdVg(12,4)=(nFET_IdVg(13,4)+nFET_IdVg(11,4))./2
i_loop=1;
temp=-10;
while i_loop<14
    
clear pfet_iv
pfet_iv(:,1)=nFET_IdVg(:,1);
pfet_iv(:,2)=nFET_IdVg(:,i_loop+1);

clear pfet_iv_flip
//pfet_iv_flip=flipdim(pfet_iv,1);
pfet_iv_flip=pfet_iv
pfet_iv_flip(:,1)=2.5 - pfet_iv_flip(:,1);
plotting="off";  // "on_final" or "off"
Ut=(K*(temp+273)./q)

epsilon=0.0002; // epsilon=0.005;
[pfet_Is(i_loop,1), pfet_VT(i_loop,1), pfet_kappa(i_loop,1)]=ekvfit_nfet(pfet_iv_flip(:,1), pfet_iv_flip(:,2), epsilon,Ut, plotting);

epsilon=0.0003; // epsilon=0.005;
[pfet_Is(i_loop,2), pfet_VT(i_loop,2), pfet_kappa(i_loop,2)]=ekvfit_nfet(pfet_iv_flip(:,1), pfet_iv_flip(:,2), epsilon,Ut, plotting);

epsilon=0.0004; // epsilon=0.005;
[pfet_Is(i_loop,3), pfet_VT(i_loop,3), pfet_kappa(i_loop,3)]=ekvfit_nfet(pfet_iv_flip(:,1), pfet_iv_flip(:,2), epsilon,Ut, plotting);

epsilon=0.0005; // epsilon=0.005;
[pfet_Is(i_loop,4), pfet_VT(i_loop,4), pfet_kappa(i_loop,4)]=ekvfit_nfet(pfet_iv_flip(:,1), pfet_iv_flip(:,2), epsilon,Ut, plotting);


temp=temp+5
i_loop=i_loop+1;    
end
temp=linspace(-10,50,13)
figure();plot(temp,pfet_Is)

figure();plot(temp,pfet_VT)
// 
//    Ut=K.*(temp+273)./q;
//plot(temp,Ith_pmos*temp.^0.5)
//figure();plot(temp,pfet_VT)
