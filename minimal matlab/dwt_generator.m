% author: zabiralnazi@yahoo.com
% 2016

DWT_SubA_Channel5_coif2_3 = zeros(5,1024,270);

for channel = 1:5
        for sample = 1:270
            DWT_SubA_Channel5_coif2_3(channel, :,...
            sample) = wden(EEGDATA(channel, :,...
            sample),'sqtwolog','s','mln',3,'coif2');
        end
end
