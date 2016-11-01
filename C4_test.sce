    
    
    tau1=1./(2*3.14*100)
    tau2=1./(2*3.14*10)
    c2 = 100e-15
    c1 = 448e-15
    cw = 420e-15 
    kap = 0.54*200e-15./(900e-15)
    Ut = 26e-3

    if pass_num == 1 then
       // cL = 600e-15 * ones(scs_m.objs(blk_objs(bl)).model.ipar(1),1)
        cL = 2e-12
    else
        ///c_net ='net'+string(blk(blk_objs(bl),2+numofip))
      // cL = cap_info(c_net)(1:scs_m.objs(blk_objs(bl)).model.ipar(1),2)
     //   cL = cap_add(cL,cap_info(c_net)(2,1),2) 
      cL =2e-12
    end

    Ibias1=(((c1+c2+cw).*(cL+c2)-c2^2)* 2*Ut)./(kap*tau1.*c2)
    Ibias2=(2*c2*Ut)./(kap*tau2)
disp(Ibias1)
disp(Ibias2)
