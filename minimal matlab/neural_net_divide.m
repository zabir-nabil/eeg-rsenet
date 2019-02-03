% One Hot Encoder format
input_mat_nn = hybrid_dataset(:,1:50);
target_mat_pre = hybrid_dataset(:,51);
target_mat_nn = zeros(450,3);

for dp = 1:450
    cln = target_mat_pre(dp);
    target_mat_nn(dp,cln) = 1;
end