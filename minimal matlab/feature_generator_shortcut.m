
% 6 Channels, 150 temporal points
SubB_Channel6_coif2_3_features = zeros(5,48,10);

for channel = 1:5
            SubB_Channel6_coif2_3_features(channel,...
            :,:) = feature_set_gen(DWT_SubB_Channel6_coif2_3...
            (channel,:,:));
end

feature_response = zeros(48,51);
for ch = 1:5
    for nt = 1:48
        feature_response(nt,(ch-1)*10+1:10*ch) = ...
            SubB_Channel6_coif2_3_features(ch,nt,:);
        feature_response(nt,51) = LABELS(nt);
    end
end


    
    
