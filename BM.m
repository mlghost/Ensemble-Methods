function forest = BM(X_train, Y_train, feature_list, n_estimators, k_split,sample_size)
  
  % Implementation of Bagged Classifier
  forest = cell(1,n_estimators);
  
  % This part is similar to Random Forest except we do not choose a subset
  % of feature list and the whole list is fed to the model. 
  for i= 1:n_estimators
    [x_train,y_train] = mbootstrap(X_train,Y_train,sample_size);
    forest{1,i} = DT(x_train,y_train,feature_list,k_split);
  end
end 