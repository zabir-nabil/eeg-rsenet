%% feature A+C

fa = feature_final;
fc = features_response_C;

hybrid_dataset = [fa;fc];

amat = [5 10 15 20 25 30 35 40 45 50];

hb = hybrid_dataset(:,1:50); %11 - 20

numberOfDimensions = 10;
coeff = pca(hb);
reducedDimension = coeff(:,1:numberOfDimensions);
reducedData = hb * reducedDimension;

corr_res = corrcoef(hb);

red_hb = [reducedData hybrid_dataset(:,51)];

x = corr_res;

for i=1:10
    for j=1:10
        if(x(i,j)<0.00)
            x(i,j) = x(i,j)*-1;
        end
    end
end

clf
heatmap(x,5:5:50,5:5:50,'%0.2f','ColorMap', @cool, 'Colorbar',true,...
'TextColor', 'k', 'FontSize', 22);



% 18 font size

