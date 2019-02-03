A_f = feature_response;
A_f2 = feature_response(:,1:50);
[coeff,score,latent,tsquared,explained] = pca(A_f2);
explained
numberOfDimensions = 10;
%coeff = pca(A_f2);
reducedDimension = coeff(:,1:numberOfDimensions);
reducedData = A_f2 * reducedDimension;
A_F = [reducedData A_f(:,51)];