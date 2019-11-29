%(
% 
% Here I have implemented the multi-level decision tree
% You can choose the number of branches for each node
% Besides, you two strategies for choosing the thresholds, 
% 1- Uniform Aproximation 
% 2- Gaussian Aproximation
% 
% )%

close all; 
clear; 
clc;
load fisheriris

% Data Prepration
X = meas;
Y = species;

C = categorical(Y);
Y = grp2idx(C);

% Number of Branches for each node
k=19;

indices = crossvalind('Kfold',species,10);

decision_tree_cp = classperf(species);

decision_tree_acc = 0.0;

% K-Fold cross-validation

for i= 1:10

    test = (indices == i);
    train = ~test;
    
    X_train = X(train,:);
    Y_train = Y(train,:);
    X_test = X(test,:);
    Y_test = Y(test,:);
    
    % Query list is the order of features selected for traversing the tree
    % which is based on Information Gain 
    
    QueryList = [];
    
    % Initial List of Features
    
    FeatureList = [1,2,3,4];
    dt = DT(X_train,Y_train,FeatureList,k);
    prediction = predict(dt,X_test,k);
    classperf(decision_tree_cp,prediction,test);
    
    decision_tree_acc =  decision_tree_acc + decision_tree_cp.CorrectRate;

end
str = sprintf('Accuracy of my Decision Tree %.15g \n',decision_tree_acc * 10);
fprintf(str)

