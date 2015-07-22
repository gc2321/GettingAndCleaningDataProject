Code Book Coursera Getting and Cleaning Data Course Project

Data were described in data package as the following:

Human Activity Recognition Using Smartphones Dataset Version 1.0

Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The description are detailed in the following url:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data package was downloaded from the following url:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data was unrar using Winrar and deposited to a folder "UCI_HAR_Dataset".

The following step were performed from files in the data package.

1. Obtain raw data table from the test set (/test/X_test.txt). Obtain activities code for test set (/test/y_test.txt).
2. Obtain raw data table from the training set (/train/X_train.txt). Obtain activities code for test set (/train/y_train.txt).
3. Combine the respective activities for both test- and training set.
4. Combine test- and train data (df "all").
5. Obtain a list of parameter measured (/features.txt). Label this as "activities" and add this as column names to "all" dataframe.
6. Change all column names with key words "mean()" and "std()", to "meanp" and "stdp". This is to mark these columns for selection at a later step.
7. Convert "all" to tbl_df from using dplyr package.
8. Subset "all" to a new dataframe, "a_ms", with "activities" and all columns with "meanp" and "stdp".
9. Rename all "meanp" and "stdp" to "mean" and "std", respectively.
10. Renames "mean.X/Y/Z" and "std.X/Y/Z" to "X/Y/Z.mean" and "X/Y/Z.std", respectively.
11. Obtain a list of row names ("activities" code) and assign to "look" dataframe.
12. Convert all "activities" code to their descriptive counterpart.
13. Reinsert the descriptive activities as row names in "a_ms". Assign this to a new dataframe "a_ms2". 
14. Sort "activities" column alphabetically.
15. Order rows by column names alphabetically.
16. Using dplyr group_by function, aggregate data by sorting into the following six activities groups: 

[1] WALKING
[2] WALKING_UPSTAIRS
[3] WALKING_DOWNSTAIRS
[4] SITTING
[5] STANDING
[6] LAYING

Assign the above to dataframe "a_ms3"

17. Using summarize_each function, compute mean of each column for each of the activities. Assign this to dataframe "a_ms4".
18. Write "a_ms4" to "tidy.txt".

Data:
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

- All columns with "mean" are the mean of each measurement.
- All columns with "std" are the standard deviation of each measurement.



