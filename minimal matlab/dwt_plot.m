% zabiralnazi@yahoo.com
% 2016
lev   = 3;
wname = 'coif2';
nbcol = 64;
signal = a_sig;
[c,l] = wavedec(signal,lev,wname);

len = length(signal);
cfd = zeros(lev,len);
for k = 1:lev
    d = detcoef(c,l,k);
    d = d(:)';
    d = d(ones(1,2^k),:);
    cfd(k,:) = wkeep1(d(:)',len);
end
cfd =  cfd(:);
I = find(abs(cfd)<sqrt(eps));
cfd(I) = zeros(size(I));
cfd = reshape(cfd,lev,len);
cfd = wcodemat(cfd,nbcol,'row');

colormap(hot(nbcol));
image(cfd);
tics = 1:lev;
labs = int2str((1:lev)');
ax = gca;
ax.YTickLabelMode = 'manual';
ax.YDir = 'normal';
ax.Box = 'On';
ax.YTick = tics;
ax.YTickLabel = labs;
title('Discrete Wavelet Transform, Absolute Coefficients.');
xlabel('Time (or Space)');
ylabel('Level');