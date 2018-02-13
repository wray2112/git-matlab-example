clear all; close all; clc;

%% load test data set
load('Data/testSet.mat');

% test result
assert(isstruct(testSet));

%% write a function: splitData() to split the dataset into two structures with the same organisation, divided by the NMDA value of the mice, calling one 'control' and the other 'test'. The result should be two structures organised in the same way as testSet where all the mice in Control have NMDA = 0 and all the mice in Test have NMDA > 0.
[control, test] = splitData(testSet);

% test result
assert(length(fieldnames(control)) == 6); assert(length(fieldnames(test)) == 8);
assert(control.maus000720994A.NMDA == 0); assert(test.maus000719FEE4.NMDA == 2125);


