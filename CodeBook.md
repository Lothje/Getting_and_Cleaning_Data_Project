# CodeBook for project Getting and Cleaning data

## Input files

The input files for this project are:

* features.txt A 561-feature vector with time and frequency domain variables (column names)
* activity_labels.txt Activity label that goes with the activity id
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
