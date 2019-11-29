classdef DT
    % An Object-Oriented Implementation of Decision Tree 
    % Each object of this class has a dataset, label set, best feature, and
    % a list of child with the same type (DT) 
    properties 
        data; % data set
        label; % label set
        BF; % best feature chosen based on Information Gain  
        childs={}; % List of Children 
        k = 2; % Number of splits for the current node
        Ts; % Thresholds for best feature at hand
    end
    
    methods
        function obj = DT(data,label,features,k)
            
            [best_feature, Ts ]= FindBestFeature(data,label,features,k);
            % Initialization of the class properties
            obj.Ts = Ts;
            obj.k = k;
            obj.BF = best_feature;
            obj.data = data;
            obj.label = label;
            
            % excluding best feature from the feature list
            features = features(~(features == best_feature));
            
            if (length(features)> 0) && (length(data)  > 0)
                
                [subsets, labels]= split(data,label,best_feature,Ts);
                obj.childs = cell(1,size(subsets,2));
                
                % for each subset of data in the dataset of the current
                % node I create a DT node.
                for i= 1:size(subsets,2)
                    if size(subsets{i},1) > 0
                        obj.childs{i} = DT(subsets{1,i},labels{1,i},features,k);
                    end
                end
            end
        end
    end
end