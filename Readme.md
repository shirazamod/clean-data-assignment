# Getting and Cleaning Data Assignment
## Human Activity Recognition Using Smartphones Data Set

This repo contains the results of the Coursera Getting and Cleaning Data Assignment. 

The following files are contained in this repo:

### run_analysis.R
The file run_analysis.R transforms the data from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones in the following manner:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

This file will only work if the data set mentioned above has been downloaded and resides in the working directory.

### Codebook.md
The file Codebook.md describes the variables, the data, and transformations that have been performed (by run_analysis.R)to clean up the original data.

### Readme.md
You've just finished reading this file!