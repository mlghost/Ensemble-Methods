function predictions = RF_predict(forest,X_test)
  
  % Predicts the label of samples based on majority voting between trees in
  % existing in the forest.
  
  labels = cell(1,length(forest));
  % collects all predicted labels from the trees.
  for i= 1: length(forest)
    labels{1,i} = predict(forest{1,i},X_test, forest{1,i}.k);
  end
  
  predictions = zeros(1,length(X_test));
  
  % for each sample in the X_test applies majority voting
  for i=1:length(X_test)
    sample_labels = zeros(1,length(forest));
    for j=1:length(forest)
      l = labels{j};
     
      sample_labels(1,j) = l(i);
    end
    predictions(1,i) = vote(sample_labels);
  
  end
end 