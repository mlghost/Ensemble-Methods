function T = find_thresh(Xj, k, strategy)
    
    % finds the thresholds for spliting the dataset in each node of the
    % tree
    
    T = zeros(1,k);
    
    % Guassian Approximation
    if strcmp(strategy, 'Guassian') == 1
        mu = mean(Xj);
        sigma = std(Xj);
        for i= 1:k
            T(i) = mu + inv(normcdf(i/(k+1)))\sigma ;
        end
    else
       % Uniform Approximation
       minimum = min(Xj);
       maximum = max(Xj);
       for i= 1:k
           T(i) = minimum  + i * (maximum - minimum)/(k+1);
       end
    end
end