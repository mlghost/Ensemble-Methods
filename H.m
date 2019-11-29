function entropy = H(L)
    
    % computes the entropy for a 1D label list
    
    if isempty(L)
        entropy = 0;
    else
        unique_vals = unique(L);
        entropy = 0;
        for c= 1:length(unique_vals)
            mask = (L == c);
            sub_set = L(mask,:);
            p = length(sub_set)/length(L);
            entropy = entropy - p * log(p + 1e-7);
        end
        
    end
    
end