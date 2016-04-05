
## Make sure that the required data files are inside "UCI HAR Dataset" folder in the working directory

setwd("./UCI HAR Dataset")

##### Load the datasets #####

# Load activity labels and features
activity_label <- read.table("activity_labels.txt")
activity_label[,2] <- as.character(activity_label[,2])
features <- read.table("features.txt")
features[,2] <- as.character(features[,2])

# Load the test data
data_test <- read.table("test/X_test.txt")[features_required]
activities_test <- read.table("test/Y_test.txt")
subjects_test <- read.table("test/subject_test.txt")
data_test <- cbind(subjects_test, activities_test, data_test)

#Load the train data
data_train <- read.table("train/X_train.txt")[features_required]
activities_train <- read.table("train/Y_train.txt")
subjects_train <- read.table("train/subject_train.txt")
data_train <- cbind(subjects_train, activities_train, data_train)

##### Extract the required data for mean and standard deviation #####
features_required <- grep(".*mean.*|.*std.*", features[,2])
features_required.names <- features[features_required,2]
features_required.names = gsub('-mean', 'Mean', features_required.names)
features_required.names = gsub('-std', 'Std', features_required.names)
features_required.names <- gsub('[-()]', '', features_required.names)

##### Merge and add labels to the dataset #####
data_merged <- rbind(data_train, data_test)
colnames(data_merged) <- c("subject", "activity", features_required.names)

##### Turn activities & subjects into factors #####
data_merged$activity <- factor(data_merged$activity, levels = activity_label[,1], labels = activity_label[,2])
data_merged$subject <- as.factor(data_merged$subject)

data_merged.melted <- melt(data_merged, id = c("subject", "activity"))
data_merged.mean <- dcast(data_merged.melted, subject + activity ~ variable, mean)

##### write the datasets into the file #####
write.table(data_merged.mean, "tidy_data.txt", row.names = FALSE, quote = FALSE)
