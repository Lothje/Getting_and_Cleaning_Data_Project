## script run_analysis.R for programm assignment "Getting & clearing data"
##
## Assignment:
## You should create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set with the average 
##    of each variable for each activity and each subject.
##
## directory with files:
## werkdir\UCI HAR Dataset
##
setwd("C:/Users/Gerie/Documents/werkdir/Cursus3/UCI HAR Dataset")
##
## STEP 1. Merges the training and the test sets to create one data set.
##
## Read in the data from the files
features <- read.table("features.txt", header = FALSE)
activity_labels <- read.table("activity_labels.txt", header = FALSE)
subject_test <- read.table("test/subject_test.txt", header = FALSE)
X_test <- read.table("test/X_test.txt", header = FALSE)
Y_test <- read.table("test/Y_test.txt", header = FALSE)
subject_train <- read.table("train/subject_train.txt", header = FALSE)
X_train <- read.table("train/X_train.txt", header = FALSE)
Y_train <- read.table("train/Y_train.txt", header = FALSE)

# set column names for X_train and X_test
colnames(X_test) <- features[,2]
colnames(X_train) <- features[,2]

# set columnames for Y_train and Y_test
colnames(Y_test) <- "activity_id"
colnames(Y_train) <- "activity_id"

#set column namea for subjects
colnames(subject_test) <- "subject_id"
colnames(subject_train) <- "subject_id"

# make one training table
train_group <- cbind(subject_train, Y_train, X_train)

# and one test table
test_group <- cbind(subject_test, Y_test, X_test)

# and make one overall table for test and training group
all_group <- rbind(test_group, train_group)

## STEP 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## so only where 'mean'and 'std' is in the column name, and subject and activity

all_group_mean_std <- all_group[, grepl("activity|subject|mean|std", names(all_group)) ]

## 3. Uses descriptive activity names to name the activities in the data set
## add description from activity_labels into the dataset

##  labels to activity_labels for joining tables
colnames(activity_labels) <- c("activity_id", "activity_name")

## and merge tables
all_data <- merge(activity_labels, all_group_mean_std, by = "activity_id")

## STEP 4. Appropriately labels the data set with descriptive variable names.
## rename column names
names(all_data) <- gsub("\\-std\\(\\)"," Std", names(all_data))
names(all_data) <- gsub("\\-mean\\(\\)"," Mean", names(all_data))
names(all_data) <- gsub("\\-meanFreq\\(\\)"," Mean Freq", names(all_data))
names(all_data) <- gsub("Acc"," Acceleration ", names(all_data))
names(all_data) <- gsub("Gyro"," Gyroscope ", names(all_data))
names(all_data) <- gsub("tGravity","Total Gravity", names(all_data))
names(all_data) <- gsub("(fBody|fBodyBody)","Freq Body", names(all_data))
names(all_data) <- gsub("tBody","Total Body", names(all_data))
names(all_data) <- gsub("\\-|  "," ", names(all_data))

## write data to file
write.table(all_data, file = "Tidy_dataset1.txt")

## STEP 5. From the data set in step 4, creates a second, independent tidy data set with the average 
##    of each variable for each activity and each subject.
library(dplyr)

Tidy_dataset2 <- group_by(all_data, subject_id, activity_id, activity_name) %>% summarise_each(funs(mean))

## write data to file
write.table(Tidy_dataset2, file = "Tidy_dataset2.txt")
