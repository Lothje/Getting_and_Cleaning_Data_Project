# CodeBook for project Getting and Cleaning data

## Dataset information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Input files

The input files for this project are:

* features.txt: A 561-feature vector with time and frequency domain variables (column names)
* activity_labels.txt: Activity label that goes with the activity id
* train_X.txt: Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration and Triaxial Angular velocity from the gyroscope for the training group.
* train_Y.txt: Activity id's
* subject_train.txt: Identifier of the training subject
* test_X.txt: Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration and Triaxial Angular velocity from the gyroscope for the test group.
* test_Y.txt: Activity id's
* subject_test.txt: Identifier of the test subject

## Proces tidying data

### Step 1: Merge files to one data set
Reading files all files and store them in variables. Give them appropriate column names (from features and mnaually).
Merge training and test data together to one set of data.

### Step 2: Extract means and standard deviation from data set
Extract only the columns from the data set with in de column name the word 'mean' or 'std', besides the key columns as subject and activity.

### Step 3: Add descriptive activity to each sample
Merge/Join the activity_labels with the data set with as key the activity identifier.

### Step 4: Give descriptive column names to data set
Renames the column names with appropriate labels.

Result is the first tidy data set.

### Step 5: Create second data set with only the avarages for each column per activity and subject.
Use as base the first tidy data set and group them together by activity and subject and calculate the mean and store the result in a new datatable.

## Output files

* Tidy_dataset1.txt: first tidy data set after step 4.
* Tidy_dataset2.txt: second tidy data set after step 5.
