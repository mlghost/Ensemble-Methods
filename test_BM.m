%(
% Here I have implemented the Bagged Classifier
% You can choose the number of branches for each node and the number of
% estimators as well.
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

% Hyperparameters
k=20;
sample_size = 100;
max_features = 2;

indices = crossvalind('Kfold',species,10);

BM_cp = classperf(species);

BM_acc = 0.0;


% K-Fold Cross-Validation
for i= 1:10
    
    
    test = (indices == i);
    train = ~test;
    
    X_train = X(train,:);
    Y_train = Y(train,:);
    X_test = X(test,:);
    Y_test = Y(test,:);
    
    % Initial List of Features
    
    FeatureList = [1,2,3,4];
    % X_train, Y_train, feature_list, n_estimators, k_split,sample_size
    model = BM(X_train,Y_train,FeatureList,100,k,100);
    prediction = RF_predict(model,X_test);
    
    classperf(BM_cp,prediction,test);
    
    BM_acc =  BM_acc + BM_cp.CorrectRate;
    
end
str = sprintf('Accuracy of my Bagged Classifier %.15g \n',BM_acc/10);
fprintf(str)







