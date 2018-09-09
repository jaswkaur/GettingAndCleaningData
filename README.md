# GettingAndCleaningData
## Requirements
You should create one R script called run_analysis.R that does the following.

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Steps to run script

1. Prelimenaries (included in script)
Download the zipped file from the location: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

  Follow the listed steps:

  a. If not already exist, create a folder called "rdata" and download the zip file.

    if(!file.exists("./rdata")){dir.create("./rdata")}
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileUrl,destfile="./rdata/Dataset.zip")

  b. Unzip the files and get the list of files.

    unzip(zipfile="./rdata/Dataset.zip",exdir="./data")
    filePath <- file.path("./rdata", "UCI HAR Dataset")
    files<-list.files(filePath, recursive=TRUE)
    files

2. Put run_analysis.R in the parent folder of UCI HAR Dataset, then set it as your working directory using setwd() function in RStudio.
3. Run source("run_analysis.R")

## Dependencies
The project makes use of data.table
