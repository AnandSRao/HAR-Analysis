CodeBook
========
The result of sourcing run_analysis.R is to generate two data frames: meanHarData and sdHarData.  These data frames contain the mean and standard deviation, respectively, of all observations of the 561 feature variables (listed in features.txt), broken down by subject and activity.

In addition, 3 helper functions are available after sourcing the run_analysis.R file: readDataSet, readHarData, and runAnalysis.  These helper functions are used to generate meanHarData and sdHarData.

First, readDataSet reads in all observations of feature variables from one of the two data sets (training or test), and returns them in a data frame along with the subject number and activity description associated with each observation.

Second, readHarData reads in the descriptive labels from activity_labels.txt and features.txt, calls readDataSet twice (once for training and once for test), and rbind's the two data frames together.

Finally, runAnalysis takes a particular aggregation function (such as mean or sd), calls readHarData to retrieve a data frame containing all observations, then melts the resulting data frame using the subject and activity as the id variables, and the other 561 feature variables as the measurement variables.  Finally dcast is called and the aggregation function is applied across all observations within a particular fixed (subject,activity) pair.

The script simply calls runAnalysis twice: once passing in mean to generate meanHarData, and once passing in sd to generate sdHarData.
