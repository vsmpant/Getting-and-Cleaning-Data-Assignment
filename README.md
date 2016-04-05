# Getting and Cleaning Data Course Project

The purpose of this project is to collect, work with, and clean a data set. The R script 'run_analysis.R' does following:

- Assumption: Required data is located in the working directory
- Load the data from the working directory
- Load the activity label and feature info
- Merge those two datasets - training and the test sets  - to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names.
- From above step create a tidy data set with the average of each variable for each activity and each subject and write it to a file 'tidyData.txt'.
