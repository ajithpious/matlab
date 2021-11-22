%Clear workspace
clear

%Set k
k=3;
assert(mod(k, 2)==1, "The value of k must be a positive odd integer")

%Set number of data points in each set
num_samples = 200;
train_division = 0.7;
num_train_0s = 0.5*train_division*num_samples;
num_train_1s = 0.5*train_division*num_samples;
num_test_0s = ceil(0.5*(1-train_division)*num_samples);
num_test_1s = ceil(0.5*(1-train_division)*num_samples);

%Generate training data
X0_train = class0sample(num_train_0s);
X1_train = class1sample(num_train_1s);
X_train = vertcat(X0_train, X1_train);
Y_train = vertcat(zeros(num_train_0s, 1), ones(num_train_1s, 1));

%Generate test data
X0_test = class0sample(num_test_0s);
X1_test = class1sample(num_test_1s);

%Initialise targets and predictions arrays
targets = zeros(num_test_1s+num_train_1s, 1);
predictions = zeros(num_test_1s+num_train_1s, 1);

%Loop for each test sample
i0s=1;
i1s=1;
for i = 1:num_test_1s+num_test_0s
    
    %Extract test sample
    if mod(i,2)==1
        position=X0_test(i0s,:);
        i0s = i0s+1;
    else
        position=X1_test(i1s,:);
        i1s = i1s+1;
        targets(i) = 1;
    end
    
    %Test model on sample
    label = getlabel(position, X_train, Y_train, k);
    if label == 1
        predictions(i) = 1;
    end
    
end


%Calculate and display performance measures
accuracy = 1-sum(abs(predictions-targets))/(num_test_1s+num_test_0s);
disp("Accuracy: " + string(accuracy))
precision = sum(predictions(targets == 1))/sum(predictions);
disp("Precision: " + string(precision))
recall = sum(predictions(targets == 1))/sum(targets);
disp("Recall: " + string(recall))
F1score = 2/((1/precision)+(1/recall));
disp("F1-score: " + string(F1score))


function label = getlabel(position, X_train, Y_train, k)
    diffs = position - X_train;
    dists = sqrt(diffs(:,1).^2 + diffs(:,2).^2);
    sorted_dists_and_labels = sortrows(horzcat(dists, Y_train));
    label = mode(sorted_dists_and_labels(1:k, 2));
end
    
function positions = class0sample(n)
    positions = zeros(n,2);
    positions(:,1) = randn(n,1)*1 + 11;
    positions(:,2) = randn(n,1)*0.6 + 5;
end

function positions = class1sample(n)
    positions = zeros(n,2);
    positions(:,1) = randn(n,1)*1.4 + 10.5;
    positions(:,2) = randn(n,1)*0.5 + 6;
end