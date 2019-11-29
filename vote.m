function most_freq  = vote(l)
    
    % implementation of voting for leaf nodes, to choose a label for a
    % sample based on the label of majority of existing samples in that
    % node.
    uval  = unique(l);
    most_freq = 0;
    freq = 0;
    
    % Here, for each of the unique values in the label set I count them and
    % most frequent one is chosen as the label
    for i= 1:length(uval)
        count = sum(l(:) == uval(i));
        if  count > freq
            freq = count;
            most_freq = uval(i);
        end
    end
end
