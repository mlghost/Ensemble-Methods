function [data,by]= wbootstrap(org_data,y, sample_size)
    
    % Implmentation of Bootstrapping without replacement. 
    % org_data : source dataset
    % y: source labels
    % sample_size: size of the output bootstrapped dataset
    
    % placeholder for bootstrapped X
    data = zeros(sample_size,size(org_data,2));
    
    % placeholder for bootstraped labels
    by = zeros(sample_size,1);
    
    all_data = [org_data y];
    
    % In this loop, each time I create a permutation of the array and take
    % the first element as the one which is chosen. Then I pop that element
    % from the list.
    for i= 1:sample_size
        all_data = all_data(randperm(length(all_data)));
        data(i,:) = all_data(1,1:4);
        by(i) = all_data(1,5);
        all_data(1) = [];
    end
    
end
