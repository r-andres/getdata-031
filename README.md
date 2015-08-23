# getdata-031: Getting and Cleaning Data Course Project

## Index
* Objective
* The tidy dataset
* The analysis
* How to run 'run_analysis.R'
* Reading the tidy dataset
* Code book
* License of the original dataset



## Objective
The objective of the __Getting and Cleaning Data Course Project__ is the preparation of a dataset ready for the next stages of data analysis. 

The source dataset comprises information about Human Activity Recognition Using Smartphones, the aim of the project is to create a tidy dataset and to document its content and the procedure to get it.


## The tidy dataset

The tidy dataset collects data about human activity recognition experiments that have been carried out with a group of 30 volunteers. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone. 

Using its embedded accelerometer and gyroscope, the authors of the experiment captured 3-axial linear acceleration and 3-axial angular velocity. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Full details can be found at: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Each record provided contains (more details in the code book section)

- 60-feature vector with time and frequency domain variables.
- Its activity label. 
- An identifier of the subject who carried out the experiment.

**Notes** 
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.
- First line contains the name of each feature.
- Only meaningful mean() and std() features have been left.
- The "BodyBody" features have been also intently filtered as long as a concrete
  definition could not be deduced from the original features description.


## The analysis
The 'run_analysis.R' script does the following:
 * Retrieves from the internet the source data package.
 * Merges the training and the test sets to create one data set.
 * Extracts only the measurements on the mean and standard deviation for each measurement. 
 * Uses descriptive activity names to name the activities in the data set.
 * Appropriately labels the data set with descriptive variable names. 
 * From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## How to run 'run_analysis.R'

1. Clone this repository from github.

```{r}
git clone https://github.com/r-andres/getdata-031.git

```


1. Execute the following code in the R framework. 

```{r}
setwd('path/to/your/local/clone')

source('run_analysis.R')

```


IMPORTANT:  The script, as first steps, retrieves the required data package from internet and decompresses it. 
The 'run_analysis.R' script can be run without downloading the original data as long as the data required is prepared in your working directory.

IMPORTANT:  Ensure that the library **dplyr** is installed in your R framework.



## Reading the tidy dataset

The generated tidy dataset can be read using the following R code:

```{r}

datasetUrl <- "https://s3.amazonaws.com/coursera-uploads/user-21e4afc992e7f65de3e38265/975115/asst-3/67b6ebd049a911e587f73d59c5a829d9.txt"
localfile <- "tidy_data.txt"

if (!file.exists(localfile)) {
  download.file(datasetUrl, destfile = localfile, method="curl")
} 


tidyDataDS <- read.table(localfile, header = TRUE, sep=",")
```


## Code book

#### activity  
 Identifies the activity being performed by the volunteer for each window sample. Possible values:  WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.

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



## License of the original dataset

======
Human Activity Recognition Using Smartphones Dataset
Version 1.0
=======
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - University degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
======


Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

For more information about this dataset contact: activityrecognition@smartlab.ws


[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

