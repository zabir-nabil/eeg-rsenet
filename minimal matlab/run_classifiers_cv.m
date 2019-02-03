disp('Running classifiers (5 fold CV)');

disp('Complex tree validation accuracy (%)');
[a, b] = complex_tree_cv(features_response_A);
disp(b*100);


disp('Cubic SVM validation accuracy (%)');
[a, b] = cubic_svm_cv(features_response_A);
disp(b*100);

disp('Weighted KNN validation accuracy (%)');
[a, b] = weighted_knn_cv(features_response_A);
disp(b*100);

disp('RusBoost tree validation accuracy (%)');
[a, b] = rusboost_cv(features_response_A);
disp(b*100);

disp('Bagged tree validation accuracy (%)');
[a, b] = bagged_tree_cv(features_response_A);
disp(b*100);