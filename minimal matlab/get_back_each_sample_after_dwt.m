SubA_5C_LRF_c5_dwt_coif2_3 = zeros(270,1024);
% db6_3 and coif2_3
for smp = 1:270
    SubA_5C_LRF_c5_dwt_coif2_3(smp,:) = ... 
    DWT_SubA_C5_c5_coif2_3(1,(smp-1)*1024+1:smp*1024);
end