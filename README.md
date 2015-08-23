# getdata-031: Getting and Cleaning Data Course Project


* auto-gen TOC:
{:toc}


## Objective


**Notes** 
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

## The analysis
The 'run_analysis.R' script does the following:
 * Retrieves from the internet the source data package
 * Merges the training and the test sets to create one data set.
 * Extracts only the measurements on the mean and standard deviation for each measurement. 
 * Uses descriptive activity names to name the activities in the data set
 * Appropriately labels the data set with descriptive variable names. 
 * From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## How to run 'run_analysis.R'

IMPORTANT:  The script, as first steps, retrieves the required data package from internet and decompresses it. 
The 'run_analysis.R' script can be run without downloading the original data as long as the data required is prepared in your working directory.

IMPORTANT:  Ensure that the library **dplyr** is installed in your R framework




## Reading the tidy dataset

The generated tidy dataset can be read using the following R code


```{r}

datasetUrl <- "https://s3.amazonaws.com/coursera-uploads/user-21e4afc992e7f65de3e38265/975115/asst-3/72bbc6d0433311e5b58c2fe8aa1527b4.txt"
localfile <- "tidy_data.txt"

if (!file.exists(localfile)) {
  download.file(datasetUrl, destfile = localfile, method="curl")
} 


tidyDataDS <- read.table(localfile, header = TRUE, sep=",")
```


## Code book

#### activity  
 Identifies the activity being performed by the volunteer for each window sample. Possible values:  WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING  

#### subject  
 Identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

#### tBodyAcc-mean()-X  
 **Mean value** of the body linear acceleration signal in the axis _X_ (time domain analysis) 

#### tBodyAcc-mean()-Y  
 **Mean value** of the body linear acceleration signal in the axis _Y_ (time domain analysis) 

#### tBodyAcc-mean()-Z  
 **Mean value** of the body linear acceleration signal in the axis _Z_ (time domain analysis) 

#### tBodyAcc-std()-X  
 **Standard deviation** of the body linear acceleration signal in the axis _X_ (time domain analysis) 

#### tBodyAcc-std()-Y  
 **Standard deviation** of the body linear acceleration signal in the axis _Y_ (time domain analysis) 

#### tBodyAcc-std()-Z  
 **Standard deviation** of the body linear acceleration signal in the axis _Z_ (time domain analysis) 

#### tGravityAcc-mean()-X  
 **Mean value** of the gravity linear acceleration signal in the axis _X_ (time domain analysis) 

#### tGravityAcc-mean()-Y  
 **Mean value** of the gravity linear acceleration signal in the axis _Y_ (time domain analysis) 

#### tGravityAcc-mean()-Z  
 **Mean value** of the gravity linear acceleration signal in the axis _Z_ (time domain analysis) 

#### tGravityAcc-std()-X  
 **Standard deviation** of the gravity linear acceleration signal in the axis _X_ (time domain analysis) 

#### tGravityAcc-std()-Y  
 **Standard deviation** of the gravity linear acceleration signal in the axis _Y_ (time domain analysis) 

#### tGravityAcc-std()-Z  
 **Standard deviation** of the gravity linear acceleration signal in the axis _Z_ (time domain analysis) 

#### tBodyAccJerk-mean()-X  
 **Mean value** of the body linear acceleration jerk signal in the axis _X_ (time domain analysis) 

#### tBodyAccJerk-mean()-Y  
 **Mean value** of the body linear acceleration jerk signal in the axis _Y_ (time domain analysis) 

#### tBodyAccJerk-mean()-Z  
 **Mean value** of the body linear acceleration jerk signal in the axis _Z_ (time domain analysis) 

#### tBodyAccJerk-std()-X  
 **Standard deviation** of the body linear acceleration jerk signal in the axis _X_ (time domain analysis) 

#### tBodyAccJerk-std()-Y  
 **Standard deviation** of the body linear acceleration jerk signal in the axis _Y_ (time domain analysis) 

#### tBodyAccJerk-std()-Z  
 **Standard deviation** of the body linear acceleration jerk signal in the axis _Z_ (time domain analysis) 

#### tBodyGyro-mean()-X  
 **Mean value** of the body angular velocity signal in the axis _X_ (time domain analysis) 

#### tBodyGyro-mean()-Y  
 **Mean value** of the body angular velocity signal in the axis _Y_ (time domain analysis) 

#### tBodyGyro-mean()-Z  
 **Mean value** of the body angular velocity signal in the axis _Z_ (time domain analysis) 

#### tBodyGyro-std()-X  
 **Standard deviation** of the body angular velocity signal in the axis _X_ (time domain analysis) 

#### tBodyGyro-std()-Y  
 **Standard deviation** of the body angular velocity signal in the axis _Y_ (time domain analysis) 

#### tBodyGyro-std()-Z  
 **Standard deviation** of the body angular velocity signal in the axis _Z_ (time domain analysis) 

#### tBodyGyroJerk-mean()-X  
 **Mean value** of the body angular velocity jerk signal in the axis _X_ (time domain analysis) 

#### tBodyGyroJerk-mean()-Y  
 **Mean value** of the body angular velocity jerk signal in the axis _Y_ (time domain analysis) 

#### tBodyGyroJerk-mean()-Z  
 **Mean value** of the body angular velocity jerk signal in the axis _Z_ (time domain analysis) 

#### tBodyGyroJerk-std()-X  
 **Standard deviation** of the body angular velocity jerk signal in the axis _X_ (time domain analysis) 

#### tBodyGyroJerk-std()-Y  
 **Standard deviation** of the body angular velocity jerk signal in the axis _Y_ (time domain analysis) 

#### tBodyGyroJerk-std()-Z  
 **Standard deviation** of the body angular velocity jerk signal in the axis _Z_ (time domain analysis) 

#### tBodyAccMag-mean()  
 **Mean value** of the magnitude of the three-dimensional body linear acceleration signals  (time domain analysis) 

#### tBodyAccMag-std()  
 **Standard deviation** of the magnitude of the three-dimensional body linear acceleration signals  (time domain analysis) 

#### tGravityAccMag-mean()  
 **Mean value** of the magnitude of the three-dimensional gravity linear acceleration signals  (time domain analysis) 

#### tGravityAccMag-std()  
 **Standard deviation** of the magnitude of the three-dimensional gravity linear acceleration signals  (time domain analysis) 

#### tBodyAccJerkMag-mean()  
 **Mean value** of the magnitude of the three-dimensional body linear acceleration jerk signals  (time domain analysis) 

#### tBodyAccJerkMag-std()  
 **Standard deviation** of the magnitude of the three-dimensional body linear acceleration jerk signals  (time domain analysis) 

#### tBodyGyroMag-mean()  
 **Mean value** of the magnitude of the three-dimensional body angular velocity signals  (time domain analysis) 

#### tBodyGyroMag-std()  
 **Standard deviation** of the magnitude of the three-dimensional body angular velocity signals  (time domain analysis) 

#### tBodyGyroJerkMag-mean()  
 **Mean value** of the magnitude of the three-dimensional body angular velocity jerk signals  (time domain analysis) 

#### tBodyGyroJerkMag-std()  
 **Standard deviation** of the magnitude of the three-dimensional body angular velocity jerk signals  (time domain analysis) 

#### fBodyAcc-mean()-X  
 **Mean value** of the body linear acceleration signal in the axis _X_ (frequency domain analysis) 

#### fBodyAcc-mean()-Y  
 **Mean value** of the body linear acceleration signal in the axis _Y_ (frequency domain analysis) 

#### fBodyAcc-mean()-Z  
 **Mean value** of the body linear acceleration signal in the axis _Z_ (frequency domain analysis) 

#### fBodyAcc-std()-X  
 **Standard deviation** of the body linear acceleration signal in the axis _X_ (frequency domain analysis) 

#### fBodyAcc-std()-Y  
 **Standard deviation** of the body linear acceleration signal in the axis _Y_ (frequency domain analysis) 

#### fBodyAcc-std()-Z  
 **Standard deviation** of the body linear acceleration signal in the axis _Z_ (frequency domain analysis) 

#### fBodyAccJerk-mean()-X  
 **Mean value** of the body linear acceleration jerk signal in the axis _X_ (frequency domain analysis) 

#### fBodyAccJerk-mean()-Y  
 **Mean value** of the body linear acceleration jerk signal in the axis _Y_ (frequency domain analysis) 

#### fBodyAccJerk-mean()-Z  
 **Mean value** of the body linear acceleration jerk signal in the axis _Z_ (frequency domain analysis) 

#### fBodyAccJerk-std()-X  
 **Standard deviation** of the body linear acceleration jerk signal in the axis _X_ (frequency domain analysis) 

#### fBodyAccJerk-std()-Y  
 **Standard deviation** of the body linear acceleration jerk signal in the axis _Y_ (frequency domain analysis) 

#### fBodyAccJerk-std()-Z  
 **Standard deviation** of the body linear acceleration jerk signal in the axis _Z_ (frequency domain analysis) 

#### fBodyGyro-mean()-X  
 **Mean value** of the body angular velocity signal in the axis _X_ (frequency domain analysis) 

#### fBodyGyro-mean()-Y  
 **Mean value** of the body angular velocity signal in the axis _Y_ (frequency domain analysis) 

#### fBodyGyro-mean()-Z  
 **Mean value** of the body angular velocity signal in the axis _Z_ (frequency domain analysis) 

#### fBodyGyro-std()-X  
 **Standard deviation** of the body angular velocity signal in the axis _X_ (frequency domain analysis) 

#### fBodyGyro-std()-Y  
 **Standard deviation** of the body angular velocity signal in the axis _Y_ (frequency domain analysis) 

#### fBodyGyro-std()-Z  
 **Standard deviation** of the body angular velocity signal in the axis _Z_ (frequency domain analysis) 

#### fBodyAccMag-mean()  
 **Mean value** of the magnitude of the three-dimensional body linear acceleration signals  (frequency domain analysis) 

#### fBodyAccMag-std()  
 **Standard deviation** of the magnitude of the three-dimensional body linear acceleration signals  (frequency domain analysis) 

#### fBodyBodyAccJerkMag-mean()  
 **Mean value** of the magnitude of the three-dimensional NA  (frequency domain analysis) 

#### fBodyBodyAccJerkMag-std()  
 **Standard deviation** of the magnitude of the three-dimensional NA  (frequency domain analysis) 

#### fBodyBodyGyroMag-mean()  
 **Mean value** of the  magnitude of the three-dimensional NA  (frequency domain analysis) 

#### fBodyBodyGyroMag-std()  
 **Standard deviation** of the magnitude of the three-dimensional NA  (frequency domain analysis) 

#### fBodyBodyGyroJerkMag-mean()  
 **Mean value** of the magnitude of the three-dimensional NA  (frequency domain analysis) 

#### fBodyBodyGyroJerkMag-std()  
 **Standard deviation** of the magnitude of the three-dimensionalNA  (frequency domain analysis) 







License:
========


Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

For more information about this dataset contact: activityrecognition@smartlab.ws


[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
