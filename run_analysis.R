## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.


##Download the file
if(!file.exists("./rdata")){dir.create("./rdata")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./rdata/Dataset.zip")

##Unzip the files and get the list of files
unzip(zipfile="./rdata/Dataset.zip",exdir="./rdata")
filePath <- file.path("./rdata", "UCI HAR Dataset")
files<-list.files(filePath, recursive=TRUE)
files

##Read data
features <- read.table('./rdata/UCI HAR Dataset/features.txt')
activityLabels <- read.table('./rdata/UCI HAR Dataset/activity_labels.txt')

##Reading Training data
subjectTrain <- read.table("./rdata/UCI HAR Dataset/train/subject_train.txt")
activityTrain <- read.table("./rdata/UCI HAR Dataset/train/y_train.txt")
featuresTrain <- read.table("./rdata/UCI HAR Dataset/train/X_train.txt")

##Read Test data
subjectTest <- read.table("./rdata/UCI HAR Dataset/test/subject_test.txt")
activityTest <- read.table("./rdata/UCI HAR Dataset/test/y_test.txt")
featuresTest <- read.table("./rdata/UCI HAR Dataset/test/X_test.txt")

colnames(featuresTrain) <- features[,2] 
colnames(activityTrain) <-"activityId"
colnames(subjectTrain) <- "subjectId"

colnames(featuresTest) <- features[,2] 
colnames(activityTest) <- "activityId"
colnames(subjectTest) <- "subjectId"

colnames(activityLabels) <- c('activityId','activityType')


##Merge Datasets
mergeTrain <- cbind(activityTrain, subjectTrain, featuresTrain)
mergeTest <- cbind(activityTest, subjectTest, featuresTest)
mergedDataSet <- rbind(mergeTrain, mergeTest)

##Extract measurements on mean and std deviations for each measurement
columnsWithMeanAndStd <- grep(".*Mean.*|.*Std.*", names(mergedDataSet), ignore.case=TRUE)
dim(mergedDataSet)

extractedData <- mergedDataSet[,columnsWithMeanAndStd]
dim(extractedData)

##Use descriptive activity names to name the activities in the data set
setForMeanAndStd <- mergedDataSet[ , columnsWithMeanAndStd == TRUE]
activityNameSet <- merge(mergedDataSet, activityLabels,
                         by='activityId',
                         all.x=TRUE)

## Set descriptive activity names
names(extractedData)<-gsub("BodyBody", "Body", names(extractedData))
names(extractedData)<-gsub("Mag", "Magnitude", names(extractedData))
names(extractedData)<-gsub("^t", "Time", names(extractedData))
names(extractedData)<-gsub("^f", "Frequency", names(extractedData))
names(extractedData)<-gsub("tBody", "TimeBody", names(extractedData))
names(extractedData)<-gsub("-mean()", "Mean", names(extractedData), ignore.case = TRUE)
names(extractedData)<-gsub("-std()", "STD", names(extractedData), ignore.case = TRUE)
names(extractedData)<-gsub("-freq()", "Frequency", names(extractedData), ignore.case = TRUE)
names(extractedData)<-gsub("angle", "Angle", names(extractedData))
names(extractedData)<-gsub("gravity", "Gravity", names(extractedData))
names(extractedData)

#Create a tidy data set
tidyDataSet <- aggregate(. ~subjectId + activityId, activityNameSet, mean)
tidyDataSet <- tidyDataSet[order(tidyDataSet$subjectId, tidyDataSet$activityId),]

