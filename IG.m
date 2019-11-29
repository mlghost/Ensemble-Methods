function information_gain = IG(Dataset,Label,F,k)
    
    % computes the information gain
    
    information_gain = entropy(Label);

    T = find_thresh(Dataset(:,F),k,'t');
    TL = length(Dataset);
    [~, ls] = split(Dataset,Label,F,T);
    
    for i= 1:k+1
        
        p = length(ls{i})/TL;
        h = H(ls{i});
        information_gain = information_gain - p * h; 
    end
end