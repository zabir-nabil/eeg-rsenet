% Dataset: http://www.bsp.brain.riken.jp/~qibin/homepage/Datasets.html
% I got permission to use the dataset for research purpose. [Mail: zabiralnazi@yahoo.com]

% coif2, level 3
% bandwidth -> subband selection <= level

A = load('SubA_5chan_3LRF.mat');
[ch, tp, sp] = size(A.EEGDATA);
DWT_A = zeros(ch,tp,sp);

for channel = 1:ch
        for sample = 1:sp
            DWT_A(channel, :,...
            sample) = wden(A.EEGDATA(channel, :,...
            sample),'sqtwolog','s','mln',3,'coif2');
        end
end


B = load('SubB_5chan_3LRF.mat');
[ch, tp, sp] = size(B.EEGDATA);
DWT_B = zeros(ch,tp,sp);

for channel = 1:ch
        for sample = 1:sp
            DWT_B(channel, :,...
            sample) = wden(B.EEGDATA(channel, :,...
            sample),'sqtwolog','s','mln',3,'coif2');
        end
end

C = load('SubC_5chan_3LRF.mat');
[ch, tp, sp] = size(C.EEGDATA);
DWT_C = zeros(ch,tp,sp);

for channel = 1:ch
        for sample = 1:sp
            DWT_C(channel, :,...
            sample) = wden(C.EEGDATA(channel, :,...
            sample),'sqtwolog','s','mln',3,'coif2');
        end
end


D = load('SubD_5chan_2LR.mat');
[ch, tp, sp] = size(D.EEGDATA);
DWT_D = zeros(ch,tp,sp);

for channel = 1:ch
        for sample = 1:sp
            DWT_D(channel, :,...
            sample) = wden(D.EEGDATA(channel, :,...
            sample),'sqtwolog','s','mln',3,'coif2');
        end
end



E = load('SubE_5chan_2LR.mat');
[ch, tp, sp] = size(E.EEGDATA);
DWT_E = zeros(ch,tp,sp);

for channel = 1:ch
        for sample = 1:sp
            DWT_E(channel, :,...
            sample) = wden(E.EEGDATA(channel, :,...
            sample),'sqtwolog','s','mln',3,'coif2');
        end
end


F = load('SubF_6chan_2LR.mat');
[ch, tp, sp] = size(F.EEGDATA);
DWT_F = zeros(ch,tp,sp);

for channel = 1:ch
        for sample = 1:sp
            DWT_F(channel, :,...
            sample) = wden(F.EEGDATA(channel, :,...
            sample),'sqtwolog','s','mln',3,'coif2');
        end
end


G = load('SubG_6chan_2LR.mat');
[ch, tp, sp] = size(G.EEGDATA);
DWT_G = zeros(ch,tp,sp);

for channel = 1:ch
        for sample = 1:sp
            DWT_G(channel, :,...
            sample) = wden(G.EEGDATA(channel, :,...
            sample),'sqtwolog','s','mln',3,'coif2');
        end
end



H = load('SubH_6chan_2LR.mat');
[ch, tp, sp] = size(H.EEGDATA);
DWT_H = zeros(ch,tp,sp);

for channel = 1:ch
        for sample = 1:sp
            DWT_H(channel, :,...
            sample) = wden(H.EEGDATA(channel, :,...
            sample),'sqtwolog','s','mln',3,'coif2');
        end
end

A_LAB = A.LABELS;
B_LAB = B.LABELS;
C_LAB = C.LABELS;
D_LAB = D.LABELS;
E_LAB = E.LABELS;
F_LAB = F.LABELS;
G_LAB = G.LABELS;
H_LAB = H.LABELS;

save('DWT_A.mat','DWT_A','A_LAB');
save('DWT_B.mat','DWT_B','B_LAB');
save('DWT_C.mat','DWT_C','C_LAB');
save('DWT_D.mat','DWT_D','D_LAB');
save('DWT_E.mat','DWT_E','E_LAB');
save('DWT_F.mat','DWT_F','F_LAB');
save('DWT_G.mat','DWT_G','G_LAB');
save('DWT_H.mat','DWT_H','H_LAB');

