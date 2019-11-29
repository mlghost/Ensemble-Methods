function forest = RF(X_train, Y_train, feature_list, n_estimators, k_split,sample_size,max_features)
  
  % Implementation of Random Forest
  % This function create a list of trees and returns it.
  
  forest = cell(1,n_estimators);
  
  % for each tree, we have a bootstrapped dataset and feature list which is
  % a subset of the original feature list.
  
  for i= 1:n_estimators
    [x_train,y_train] = mbootstrap(X_train,Y_train,sample_size);
    features = get_features(feature_list,max_features);
    forest{1,i} = DT(x_train,y_train,features,k_split);
  end
end 