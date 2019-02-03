% separate generation
dc1 = feature_set_gen(DWT_cyl_ch1,1);
dc2 = feature_set_gen(DWT_cyl_ch2,2);
dh1 = feature_set_gen(DWT_hook_ch1,3);
dh2 = feature_set_gen(DWT_hook_ch2,4);
dl1 = feature_set_gen(DWT_lat_ch1,5);
dl2 = feature_set_gen(DWT_lat_ch2,6);
dp1 = feature_set_gen(DWT_palm_ch1,7);
dp2 = feature_set_gen(DWT_palm_ch2,8);
ds1 = feature_set_gen(DWT_spher_ch1,9);
ds2 = feature_set_gen(DWT_spher_ch2,10);
dt1 = feature_set_gen(DWT_tip_ch1,11);
dt2 = feature_set_gen(DWT_tip_ch2,12);


data_set = [dc1;dc2;dh1;dh2;dl1;dl2;dp1;dp2;ds1;ds2;dt1;dt2];
