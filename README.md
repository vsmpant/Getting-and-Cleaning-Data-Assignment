# Getting and Cleaning Data Course Project

## Raw Data Location
Download data from the following location:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This file should be extracted in to the folder **"UCI HAR Dataset"** in the working directory such that this folder contains required text files.

## Work flow of the script
The purpose of this project is to collect, work with, and clean a data set. The R script 'run_analysis.R' does following:

- Assumption: Required data is present in the working directory ("UCI HAR Dataset" folder)
- Load the data (activity label and feature info) from the working directory
- Merge those two datasets - training and the test sets  - to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names.
- From above step create a tidy data set with the average of each variable for each activity and each subject and write it to a file 'tidyData.txt'.

## Running the script
 - Execute the file "run_analysis.R".
 - "tidy_data.txt" file will be generated.
