clear all; close all; clc;

%% load test data set
load('Data/testSet.mat');

% test result (don't edit)
assert(isstruct(testSet));

%% write a function: splitData(dataSet) to split the dataset into two structures with the same organisation, divided by the NMDA value of the mice, calling one 'control' and the other 'test'. The result should be two structures organised in the same way as testSet where all the mice in Control have NMDA = 0 and all the mice in Test have NMDA > 0.
%% EXTRA: write a function that automatically splits a dataset based on NMDA values without being explicitly given the values to split by
[control, test] = splitDataSolution(testSet);

% test result (don't edit)
assert(length(fieldnames(control)) == 6); assert(length(fieldnames(test)) == 8);
assert(control.maus000720994A.NMDA == 0); assert(test.maus000719FEE4.NMDA == 2125);

%% write a function: getParameters(dataSet, task, parameter) that takes an animal group and outputs a matrix of trial parameters for a particular task. For example, if we want to look at 'correct' over all animals in a group on a particular task, the function should output a matrix of 'correct' values, where each row is an individual animal and each column is a trial
%% EXTRA: extend this function by having it call another function that deals with the timestamp format of each trial and can therefore output a matrix of timestamps rather than integers and doubles. Does the function still work on all tasks?
controlCorrect = getParametersSolution(control, 'Memory_1', 'correct');
testCorrect = getParametersSolution(test, 'Memory_1', 'correct');

% test result (don't edit)
assert(size(controlCorrect,1) == 6); assert(size(controlCorrect,2) == 600); assert(size(testCorrect,1) == 8); assert(size(testCorrect,2) == 660);
controlRewarded = getParametersSolution(control, 'Memory_1_PL', 'rewarded'); assert(size(controlRewarded,2) == 1935);

%% write a function: binParameters(parameterMatrix, binSize) that bins parameter matrices according to a given bin size with a sliding window
%% EXTRA: write a binParameters() function that can switch between sliding and static (e.g. only calculate bin every x trials where x = binSize). Test whether this function performs better than the sliding window function.
controlPerformance = binParametersSolution(controlCorrect, 100);
testPerformance = binParametersSolution(testCorrect, 100);

% get post-lesion performance
controlPLPerformance = binParametersSolution(getParametersSolution(control, 'Memory_1_PL', 'correct'), 100);
testPLPerformance = binParametersSolution(getParametersSolution(test, 'Memory_1_PL', 'correct'), 100);

% test result (don't edit)
assert(size(controlPLPerformance,2) == 1935); assert(size(testPLPerformance,2) == 1602);

%% analyse and plot the result!
% Your code here %



