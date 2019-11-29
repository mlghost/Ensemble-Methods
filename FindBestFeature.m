function [bestFeature, Ts] = FindBestFeature(Dataset,Label,FeatureList,k)
    
    % finds the best feature among the features at hand based on the information gain by selecting that feature
    
    F= length(FeatureList);
    scores = {};
    
    for i= 1:F
        
        scores{1,i} = IG(Dataset,Label,FeatureList(i),k);
        
    end
    
    s = cell2mat(scores);
    [~, bestFeatureIndex] = max(s);
    bestFeature = FeatureList(bestFeatureIndex);
    Ts = find_thresh(Dataset(:,bestFeature),k,'t');
    
end