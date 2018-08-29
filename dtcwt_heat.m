lev   = 3;
nbcol = 64;
len = 512;
cfd = dtcwt_lev;


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
title('Dual Tree Complex Wavelet Transform Coefficients');
xlabel('Sample points');
ylabel('Level');

% Add colormap from Menu
% Export setup -> Rendering -> 600 dpi