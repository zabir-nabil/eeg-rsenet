% zabiralnazi@yahoo.com
% 2016

ch1_dwt = DWT_SubA_Channel5_coif2_3(1,:,:);
ch2_dwt = DWT_SubA_Channel5_coif2_3(2,:,:);
ch3_dwt = DWT_SubA_Channel5_coif2_3(3,:,:);
ch4_dwt = DWT_SubA_Channel5_coif2_3(4,:,:);
ch5_dwt = DWT_SubA_Channel5_coif2_3(5,:,:);

num_smp = 270;
num_feature = 10;


feature_c1 = feature_set_gen(ch1_dwt); % num_smp*feature
feature_c2 = feature_set_gen(ch2_dwt);
feature_c3 = feature_set_gen(ch3_dwt);
feature_c4 = feature_set_gen(ch4_dwt);
feature_c5 = feature_set_gen(ch5_dwt);

features_response_A = [feature_c1, feature_c2, feature_c3, ... 
    feature_c4, feature_c5, LABELS];
