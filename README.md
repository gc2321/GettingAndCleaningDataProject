# Coursera Getting and Cleaning Data Course Project

The purpose of this project is obtain data from accelerometers from the Samsung Galaxy S smartphone available from the following website:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The goal is the combine "test" and "training" dataset, extract the mean and the standard deviation of selective measurements and summarize the mean of these parameters in a table.

Specially, the following steps were performed on the downloaded data:

1. Combine "test" and "training" set.
2. Added labels (Column names) for each parameters.
3. Assigned labels to each activities according the following code:
	[1] WALKING
	[2] WALKING_UPSTAIRS
	[3] WALKING_DOWNSTAIRS
	[4] SITTING
	[5] STANDING
	[6] LAYING
4. Obtain only parameters with both mean() and std() measurements.
5. Arrange "activities" alphabetically.
6. Arrange column names alphabetically.
7. Group data into distinct "activities" groups.
8. Generated mean of each parameters for each activity.
9. Export data from step 8 to tidy.txt.

Steps performed to generate tidy.txt

1. Download data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
2. Winrar getdata_projectfiles_UCI HAR Dataset.zip
3. source run_analysis.R in RStudio.

Files included in this folder:

README.md
tidy.txt (summary table of each activity)
run_analysis.R (R code to clean the downloaded data)
CodeBook.md (Codebook for this dataset)