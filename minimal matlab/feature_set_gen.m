% zabiralnazi@yahoo.com
% 2016

function feature_vec = feature_set_gen(mat_y)

dwt_sig = mat_y;
num_feature = 10;


[~, data_pts, num_trial] = size(dwt_sig);
dwt_sig = reshape(dwt_sig,[data_pts, num_trial]);
dwt_sig = dwt_sig';
feature_vec = zeros(num_trial,num_feature); % + 1 for response if used

for nt = 1:num_trial

    % AAC (Avergae amplitude change)
    aac = 0;
    
    for i = 1:data_pts-1
        aac = aac + abs(dwt_sig(nt,i+1) - dwt_sig(nt,i));
    end
    
    aac = aac/data_pts;
    feature_vec(nt,1) = aac;
    
    % DASDV (Difference absolute standard deviation value)
    dasdv = 0;
    
    for i = 1:data_pts-1
        dasdv = dasdv + (dwt_sig(nt,i+1) - dwt_sig(nt,i))^2;
    end
    
    dasdv = dasdv/(data_pts-1);
    
    dasdv = sqrt(dasdv);
    feature_vec(nt,2) = dasdv;
    
    
    % Integrated EMG (IEMG)
    iemg = sum(abs(dwt_sig(nt,:)));
    
    feature_vec(nt,3) = iemg;
    
    % Mean absolute value (MAV)
    
    mav = iemg/data_pts;
    feature_vec(nt,4) = mav;
    
    % Modified mean absolute value Type 2(MMAV2)
    mmav2 = 0;
    
    for i = 1:data_pts
        tmp = abs(dwt_sig(nt,i));
        
        if i < 0.12*data_pts
            tmp = (tmp * 4 * i)/data_pts;
            mmav2 = mmav2 + tmp;
        end
        if i > 0.85*data_pts
                tmp = (tmp * 4 * (i-data_pts))/data_pts;
                mmav2 = mmav2 + tmp;
        end
        if i >= 0.12*data_pts && i<= 0.85*data_pts
                mmav2 = mmav2 + tmp;
        end
    end
    
    mmav2 = mmav2/data_pts;
    
    feature_vec(nt,5) = mmav2;
    
    
    % Myopulse percentage rate (MYOP) 
    
    myop_thres = 0.25;
    
    myop = (sum(dwt_sig(nt,:)>myop_thres))/data_pts;
    
    feature_vec(nt,6) = myop;
    
    % Root mean square (RMS)
    
    rms = sqrt(sum(dwt_sig(nt,:).^2)/data_pts);
    
    feature_vec(nt,7) = rms;
    
    % Slope sign change (SSC)
    ssc_thres = 0.08;
    ssc = 0;
    
    for i = 2:data_pts-1
        
        tmp1 = (dwt_sig(nt,i) - dwt_sig(nt,i-1))*(dwt_sig(nt,i) - dwt_sig(nt,i+1));
       
        if tmp1 >= ssc_thres
            ssc = ssc + 1;
        end
    end
    
    feature_vec(nt,8) = ssc;
    
    
    % Second spectral moment SM2
    sm2 = 0;
    
    rng default;
    
    [psd, fbin] = pwelch(dwt_sig(nt,:));
    
    bin_len = length(psd);
    
    for j = 1:bin_len
        sm2 = sm2 + psd(j)*(fbin(j)^2);
    end
    
    feature_vec(nt,8) = sm2;
    
    % Log detector (LOG)
    
    logd = exp(sum(log(abs(dwt_sig(nt,:))))/data_pts);
    
    feature_vec(nt,9) = logd;
    
    % Waveform length (WL)
    
    wl = 0;
    
    for i = 1:data_pts-1
        wl = wl + abs(dwt_sig(nt,i+1) - dwt_sig(nt,i));
    end
    
    feature_vec(nt,10) = wl;
    
    
    % feature_vec(nt,11) = resp;
    
end
end