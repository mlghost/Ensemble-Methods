function label = predict_label( sample, order, Dataset, Labels, k)

% makes a prediction for a single sample based on the feature order and the training dataset

d = Dataset;
l = Labels;

for i= 1:length(order)
  if length(d) > 0
    
    T = find_thresh(Dataset(:,order(i)),k,'t');
    
    [subsets,labels] = split(d,l, order(i), T);
    
    value = sample(order(i));
    
    % Here I compare the feature value of the sample with the
    % thresholds and choose the corresponding subset.
    
    % Checking for first subset
    if value < T(1) && length(subsets{1}) > 0
      
      d = subsets{1};
      l = labels{1};
      
    % Checking for the last subset
    elseif value > T(k) && length(subsets{k+1}) > 0
      
      d = subsets{k+1};
      l = labels{k+1};
      
      
    else
      
      % Checking membership of the sample for the rest of the
      % subsets between the first one and last.
      
      for j= 2:k
        if (value >= T(j-1)) && (value < T(j)) && length(subsets{j}) > 0
          
          d = subsets{j};
          l = labels{j};
          
          break;
        end
      end
      
    end
  end
end

label = vote(l);

end