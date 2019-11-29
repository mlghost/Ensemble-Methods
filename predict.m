function prediction = predict(DT,X_test, k)

% makes prediction for several samples

prediction = zeros(1,length(X_test));

  for i = 1: length(X_test)
  
    prediction(i) = find_label(DT,X_test(i,:),k);
  
  end
end