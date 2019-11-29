function [subs,ls] = split(Dataset,Label,F,T)
    
    % Splites the dataset based on the feature F and the list of selected
    % thresholds for that feature
    
    subs = cell(1,length(T)+1);
    ls = cell(1,length(T)+1);
    
    for i= 1:length(T)
      
        if i == 1
            
            mask = (Dataset(:,F) < T(i));
            subs{i} = Dataset(mask,:);
            ls{i} = Label(mask);
        
        elseif (1 < i < length(T))
            
            mask = ( (T(i-1) <= Dataset(:,F)) & ( Dataset(:,F) < T(i)));
            subs{i} = Dataset(mask,:);
            ls{i} = Label(mask);
        
        else
        
            mask = (Dataset(:,F) >= T(i));
            subs{i} = Dataset(mask,:);
            ls{i} = Label(mask);
        
        end

    end
   
end