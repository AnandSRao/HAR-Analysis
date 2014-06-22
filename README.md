HAR-Analysis
============
This repository contains a script for processing data collected from Samsung Galaxy S smartphone accelerometers.  This data set can be downloaded here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

More detail about the data set is available here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The script run_analysis.R is designed to run from the root directory of the extracted zip file.  It merges the two data sets (training and test) into a single data set, computes the mean and standard deviation of the feature variables broken down by subject and activity, and returns the results in data frames called meanHarData and sdHarData respectively.  It also makes use of activity_labels.txt and features.txt to assign descriptive names to the activity factor levels as well as to the columns representing the various feature variables.
