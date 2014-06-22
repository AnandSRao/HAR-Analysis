library(reshape2)


# Return data frame containing feature variables from one of the two data sets
# (test or training), along with subject number and descriptive activity name
# for each row of variables.
readDataSet <- function(dataFile, activityFile, subjectFile,
                     featureLabels, activityLabels) {
    # Read in observations of feature variables, use descriptive feature names
    data <- read.table(dataFile, col.names=featureLabels)
    
    # Read in activity numbers corresponding to the above observations
    # Use descriptive activity names
    activityNumbers <- read.table(activityFile, col.names='activity')
    activity <- activityLabels[activityNumbers[,1]]
    
    # Read in subject numbers corresponding to the above observations
    subject <- read.table(subjectFile, col.names='subject')
    
    # Combine above data into a single data frame
    cbind(data, subject, activity)
}


# Return data frame containing all observations of feature variables from both
# the test and training Human Activity Recognition data sets.
readHarData <- function()
{
    al <- read.table('activity_labels.txt', col.names=c('number','activity'))
    fl <- read.table('features.txt', col.names=c('number','feature'))
    
    trainData <- readDataSet('train/X_train.txt', 'train/y_train.txt',
                             'train/subject_train.txt', fl$feature, al$activity)
    
    testData <- readDataSet('test/X_test.txt', 'test/y_test.txt',
                            'test/subject_test.txt', fl$feature, al$activity)
    
    rbind(trainData, testData)
}


# Return data frame containing the result of applying an aggregation function
# across HAR feature variables broken down by subject and activity.  Typical
# choices for the aggregation function include mean and sd.
runAnalysis <- function(ag_fnc)
{
    harData <- readHarData()
    vars <- names(harData)[!names(harData) %in% c('subject','activity')]
    harDataMelt <- melt(harData, id=c('subject','activity'), measure.vars=vars)
    dcast(harDataMelt, subject + activity ~ variable, ag_fnc)
}


meanHarData <- runAnalysis(mean)
sdHarData <- runAnalysis(sd)
