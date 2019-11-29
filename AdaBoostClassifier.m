function [alpha, forest] = AdaBoostClassifier(X_train, Y_train, T, feature_list, n_estimators, k_split,sample_size,max_features)

forest = cell(1,n_estimators);
weights = zeros(1,length(X_train));
weights = weights + 1/length(X_train);
alpha = zeros(1,n_estimators);
disp("AdaBoost traning got started...");
for epoch=1:T
  str = sprintf('Training Epoch %.15g \n',epoch);
  fprintf(str)
  for i= 1:n_estimators
    
    [x_train,y_train] = mbootstrap(X_train,Y_train,sample_size);
    features = get_features(feature_list,max_features);
    forest{1,i} = DT(x_train,y_train,features,k_split);
    err = 0;
    
    for j= 1:length(X_train)      
      err = err + weights(1,j) * (Y_train(j) ~= find_label(forest{1,i},X_train(j,:),k_split));
    end
    err = err/sum(weights);
    
    alpha(1,i) = 0.5 * log((1 -err)/err);
    
    for j= 1:length(X_train)
      
      weights(1,j) = weights(1,j) * exp(alpha(1,i) * (Y_train(j) ~= find_label(forest{1,i},X_train(j,:),k_split)));
      
    end
    
  end
end
end