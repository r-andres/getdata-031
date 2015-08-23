#
#
#

# Initial step getting the data (if not existing)

datasetUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
localfile <- "Dataset.zip"

if (!file.exists(localfile)) {
  download.file(datasetUrl, destfile = localfile, method="curl")
} 

# Decompress the data
unzip(localfile)


# Load the dplyr library
library(dplyr)


# You should create one R script called run_analysis.R that does the following. 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each
#    measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.


# Grab the indexes and labels of the measurements on the mean and standard deviation
x_features <- read.table('UCI HAR Dataset/features.txt')
sel_x_features <- subset(x_features,
                         `&`( grepl("*mean\\(|*std\\(", x_features$V2),
                                    !(grepl("*BodyBody*", x_features$V2))))



names(sel_x_features) <- c ('index', 'label')


# Read the training data, select only the measurements on the mean and std
train_X_DS <- read.table('UCI HAR Dataset/train/X_train.txt')
train_X_DS <- select(train_X_DS, sel_x_features$index)

# Read the test data, select only the measurements on the mean and std
test_X_DS <- read.table('UCI HAR Dataset/test/X_test.txt') 
test_X_DS <- select(test_X_DS, sel_x_features$index)
# Concatenate training and test data
all_X_DS <- rbind(train_X_DS, test_X_DS)
names(all_X_DS) <- sel_x_features$label

# Grab the indexes and labels of the activities
activity_labels <- read.table('UCI HAR Dataset/activity_labels.txt')
names(activity_labels) <- c ('activity_index', 'activity')

# Read the training data activity 
train_Y_DS <- read.table('UCI HAR Dataset/train/y_train.txt') 
# Read the test data activity
test_Y_DS <- read.table('UCI HAR Dataset/test/y_test.txt') 
# Concatenate training and test data
all_Y_DS <- rbind(train_Y_DS, test_Y_DS)
names(all_Y_DS) <- c ('activity_index')
# Translate the activity index into the legible label
all_Y_DS <- select(merge(all_Y_DS, activity_labels), activity)

# Read the training data subject
train_S_DS <- read.table('UCI HAR Dataset/train/subject_train.txt') 
# Read the test data subject
test_S_DS <- read.table('UCI HAR Dataset/test/subject_test.txt') 
# Concatenate training and test data
all_S_DS <- rbind(train_S_DS, test_S_DS)
names(all_S_DS) <- c ('subject')

# Finally build the dataset with all the data
allDS <- cbind(all_X_DS, all_Y_DS, all_S_DS)


# 5. From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.

split_act_sub <- split(allDS, f = list(allDS$subject, allDS$activity), drop=TRUE)

id_indexes <- which(names(allDS) %in% c("subject","activity"))
# Appying the function to calculate the means keeping the subject-activity columns
lmeans <- lapply(split_act_sub, FUN = function (x) { c (levels(factor(x$activity)), unique(x$subject),  colMeans(x[,-id_indexes]) )})

# Reconstruct the matrix  
matrix <- t(sapply(lmeans, c))

# Finally the dataset is build using the matrix
tidyDS <- data.frame(matrix)
names(tidyDS) <- c ('activity' , 'subject', as.vector(sel_x_features$label))

# Write the resultant in a text file
write.table(tidyDS, file="tidy_data.txt", row.names=FALSE, col.names=TRUE, sep = "," )



