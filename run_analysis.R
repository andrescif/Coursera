library(tidyverse)
#Load data
web <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(web,destfile = "./Coursera",method = "curl")
unzip(zipfile = "getdata_projectfiles_UCI HAR Dataset.zip",
      exdir = "./getandcleandata")

#1) Merges the training and the test sets to create one data set.
#Training data
x_train <- read.table("./getandcleandata/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./getandcleandata/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./getandcleandata/UCI HAR Dataset/train/subject_train.txt")
#Test data
x_test <- read.table("./getandcleandata/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./getandcleandata/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./getandcleandata/UCI HAR Dataset/test/subject_test.txt")
#Features
features <- read.table("./getandcleandata/UCI HAR Dataset/features.txt")
activity_labels <- read.table("./getandcleandata/UCI HAR Dataset/activity_labels.txt")
#Rename variables
colnames(x_train) <- features[,2]
colnames(y_train) <- "ID_activity"
colnames(subject_train) <- "ID_subject"

colnames(x_test) <- features[,2]
colnames(y_test) <- "ID_activity"
colnames(subject_test) <- "ID_subject"

colnames(activity_labels) <- c("ID_activity", "Type_activity")
#Create one dataset
comptrain <- cbind(y_train, subject_train, x_train)
comptest <- cbind(y_test, subject_test, x_test)
finaldataset <- rbind(comptrain, comptest)

#2) Extracts only the measurements on the mean and standard deviation for each measurement
varnames <- colnames(finaldataset)
mean_and_std <- (grepl("ID_activity", varnames) |
                   grepl("ID_subject", varnames) |
                   grepl("mean..", varnames) |
                   grepl("std...", varnames))
#Create subset of data
mean_and_std_data <- finaldataset[,mean_and_std==TRUE]

#3) Uses descriptive activity names to name the activities in the data set
with_activity_names <-  merge(mean_and_std_data, activity_labels,
                              by = "ID_activity",
                              all.x = TRUE)

#4)Appropriately labels the data set with descriptive variable names
  #Done throught the process, data set is alredy labelled.  

#5)From the data set in step 4, creates a second, independent tidy data set 
#with the average of each variable for each activity and each subject
tidySet <- aggregate(. ~with_activity_names$ID_activity + with_activity_names$ID_subject, with_activity_names, mean)
tidySet <- tidySet[order(tidySet$ID_subject, tidySet$ID_activity), ]







