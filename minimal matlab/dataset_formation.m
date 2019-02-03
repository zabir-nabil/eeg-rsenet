
% author: zabiralnazi@yahoo.com
% 2016

% load dataset
load('SubA_5chan_3LRF.mat')



% For DWT
SubA_5C_LRF_c1 = zeros(270,1024);
SubA_5C_LRF_c2 = zeros(270,1024);
SubA_5C_LRF_c3 = zeros(270,1024);
SubA_5C_LRF_c4 = zeros(270,1024);
SubA_5C_LRF_c5 = zeros(270,1024);
% 270 samples, 5 channels, 1024 data points
% 1 response
% 1024 = 256 * 4 = sampling rate * sec

for smp = 1:270
    SubA_5C_LRF_c1(smp,:) = EEGDATA(1,:,smp);
end

for smp = 1:270
    SubA_5C_LRF_c2(smp,:) = EEGDATA(2,:,smp);
end

for smp = 1:270
    SubA_5C_LRF_c3(smp,:) = EEGDATA(3,:,smp);
end

for smp = 1:270
    SubA_5C_LRF_c4(smp,:) = EEGDATA(4,:,smp);
end

for smp = 1:270
    SubA_5C_LRF_c5(smp,:) = EEGDATA(5,:,smp);
end
