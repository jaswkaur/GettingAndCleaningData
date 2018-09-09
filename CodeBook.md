# Code Book
This is a code book that describes the variables, the data, and any transformations or work that is performed to clean up the data.

## Data source
A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Introduction
One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.

## Variables Used in Script
  ## Read data and Merge
  1. rdata: Contains all the files on which exercise needs to be performed.
  2. features: contains features.txt table
  3. activityLables: contains activity_labes.txt table. Also contains columns names as activityId and activityType.
  4. Training data is read in following variales:
      a. subjectTrain: contains subject_train.txt data
      b. activityTrain: conatins y_train.txt data
      c. featuresTrain: contains x_train.txt data
      
  5. Test data is read in following variales:
      a. subjectTest: contains subject_test.txt data
      b. activityTest: conatins y_test.txt data
      c. featuresTest: contains x_test.txt data
  
  ## Merged data set
  1. mergeTrain: combination of activityTrain, subjectTrain, featuresTrain
  2. mergeTest: combination of activityTest, subjectTest, featuresTest
  3. mergedDataSet: combination of mergeTrain, mergeTest
  
  ## Extract only Mean and STD
  1. columnsWithMeanAndStd: contains columns with mean and standard deviation.
  2. extractedData: data set containing only mean and std, extracted from mergedDataSet
  
  ## Use descriptive activity names to name the activities in the data set
  1. activityNameSet: merge mergedDataSet and activityLabels by activityId
  
  ## Set descriptive activity names
  Added descriptive names using gsub function.
  1. Body for BodyBody
  2. Mag for Magnitude
  3. Time for anything stating with 't'
  4. Frequency for anything starting with 'f'
  5. TimeBody for tbody and so on...
  
  ## Tidy data set
  1. tidyDataSet: contains tidy data.
  
