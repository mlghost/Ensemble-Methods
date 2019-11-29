%(
% Here we test the performance of AdaBoost model using K-Fold
% Cross-Validation method. The hyperparameters are again, the sample size
% for each weak learner, number of splits in each node, max number of
% features. 

%)%

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
k=10; % number of splits
sample_size = 100; % the size of bootstrapped sample set for each weak learner
max_features =3; 
n_estimators = 100; % the number of weak learners
T = 1; % number of training epochs 

indices = crossvalind('Kfold',species,10);

Ada_cp = classperf(species);

Ada_acc = 0.0;


for i= 1:10
    
    
    test = (indices == i);
    train = ~test;
    
    X_train = X(train,:);
    Y_train = Y(train,:);
    X_test = X(test,:);
    Y_test = Y(test,:);
    
    % Initial List of Features
    
    FeatureList = [1,2,3,4];
    % X_train, Y_train, T, feature_list, n_estimators, k_split,sample_size,max_features
    [alpha, forest] = AdaBoostClassifier(X_train,Y_train,T,FeatureList,n_estimators,k,sample_size,max_features);
    prediction = Adaboost_predict(alpha, forest,X_test,k,3);
    
    classperf(Ada_cp,prediction,test);
    
    Ada_acc =  Ada_acc + Ada_cp.CorrectRate;
    
end
str = sprintf('Accuracy of my AdaBoost %.15g \n',Ada_acc*10);
fprintf(str)


