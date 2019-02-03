disp('Running classifiers (25% holdout data)');

disp('Complex tree validation accuracy (%)');
[a, b] = complex_tree_holdout(features_response_A);
disp(b*100);


disp('Cubic SVM validation accuracy (%)');
[a, b] = cubic_svm_holdout(features_response_A);
disp(b*100);

disp('Weighted KNN validation accuracy (%)');
[a, b] = weighted_knn_holdout(features_response_A);
disp(b*100);

disp('Boosted tree validation accuracy (%)');
[a, b] = boosted_tree_holdout(features_response_A);
disp(b*100);

disp('Bagged tree validation accuracy (%)');
[a, b] = bagged_tree_holdout(features_response_A);
disp(b*100);