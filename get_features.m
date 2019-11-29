function features = get_features(features_list,n)

  % Gives a subset of feature list with size of n
  
  shuffled = features_list(randperm(length(features_list)));
  features = shuffled(1:n);
  
end