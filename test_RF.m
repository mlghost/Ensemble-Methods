%(
% Here I have implemented the Random Forest for multi-class classification 
% You can choose the number of branches for each node and 
% number of trees as well.
% )%

close all; 
clear; 
clc;

load fisheriris

% Data Prepration
% Here the model is tested only with 2 features (to be able to visualized the decision boundries)
X = meas(:,2:3);
Y = species;

C = categorical(Y);
Y = grp2idx(C);

% Hyperparameters

k=10; % splitting factor
RF_acc = 0.0; 
sample_size = 100; % output size of bootstrapped dataset
max_features = 2; % number of featurers used to train each tree

indices = crossvalind('Kfold',species,10);

RF_cp = classperf(species);


% K-Fold cross-validation 

for i= 1:10
    
    
    test = (indices == i);
    train = ~test;
    
    X_train = X(train,:);
    Y_train = Y(train,:);
    X_test = X(test,:);
    Y_test = Y(test,:);
    
    % Initial List of Features
    
    FeatureList = [1,2];
    % X_train, Y_train, feature_list, n_estimators, k_split, n_leaf,sample_size,max_features
    model = RF(X_train,Y_train,FeatureList,100,k,100,2);
    prediction = RF_predict(model,X_test);
    
    classperf(RF_cp,prediction,test);
    
    RF_acc =  RF_acc + RF_cp.CorrectRate;
    
end
str = sprintf('Accuracy of my Random Forest %.15g \n',RF_acc*10);
fprintf(str)

% Here I create a meshgrid of inputs to cover a large area in the space.
% points generated here in the meshgrid are fed to the model to be labeled.
% Due to the size of generated pairs here it takes a little bit long for
% the model to visualize the result.

x1range = min(X(:,1)):.01:max(X(:,1));
x2range = min(X(:,2)):.01:max(X(:,2));
[xx1, xx2] = meshgrid(x1range,x2range);
XGrid = [xx1(:) xx2(:)];

QueryList = [];
    

FeatureList = [1,2];

model = RF(X,Y,FeatureList,100,k,100,2);
prediction = RF_predict(model,XGrid);

hold on 

gscatter(xx1(:), xx2(:), prediction,'rgb');
gscatter(X(:,1), X(:,2), Y,'rgb','*',8);

hold off







