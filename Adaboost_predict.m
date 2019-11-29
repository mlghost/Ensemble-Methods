function labels = Adaboost_predict(alpha, forest,X_test,k_split,C)

  labels = zeros(1,length(X_test));
  
  for i= 1:length(X_test)
    vals = zeros(1,C);
    for k=1:C
      res = 0;
      for j= 1:length(forest)
        res = res + alpha(1,j) * (k == find_label(forest{1,j},X_test(i,:),k_split));
      end
      vals(1,k) = res;
      
    end
    [~,h] = max(vals);
    labels(1,i) = h;
  end
end