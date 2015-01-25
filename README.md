Getting and Cleaning Data: Course Project


Roadmap:
1.	Information related to the course project
2.	Project background information summary

Course Project Information:

Project Synopsis:  The tasks for this project included creating an R script that would, merge the training and test files into one data set, extract only the measurements that included a “mean” of “measurement” characteristic in its variable name, rename the variables in a meaningful context, and create a tidy data set of these results.  A README.md file and CodeBook.md were made to help interpret the entire project.
Documents related to building the tidy data set including, ‘run_analysis.R’ script, README.md, and CodeBook.md can be found at GitHup https://github.com/datamick/getcleancourseproject.git.
The tidygetcleandata.txt output file was uploaded, and can be viewed through the Coursera/Getting and Cleaning Data evaluation of Course Project page.
Initial Raw Files Utilized:
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels(numeric corresponding to “activity” labels).
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels(numeric corresponding to “activity” labels).
- 'subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
- 'subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
Raw files link for download: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Manipulation of Files and File Descriptions:
id: Chronological numbering of x_test, y_test, subject_test, s_train, y_train, subject_train files for consistent merging
testcombined: Merged file of subject_test, y_test, x_test (resulting columns: id, activities, value variables).
traincombined: Merged file of subject_train, y_ train, x_ train (resulting columns: id, activities, value variables).
combinedtraintest: Merged file of ‘testcombined’ and ‘traincombined’ files.

Extracted Files for Course Project:
newdata: File of extracted ‘mean’ and ‘standard deviation’ related variables from ‘combinedtraintest’ file.
namecol: Renamed all ‘newdata’ variables to more descriptive format.
subjectgrp: Grouped the data by subject and activities.
subgrp1: Summarizes the grouped data by mean values.

Reading and Viewing the Tidy Data Set:
The tidy data set was written to ‘tidygetcleandata.txt’.  It can be retrieved, loaded, and viewed in R after being downloaded to your working directory with the commands below.
data <- read.table(
"<Your Working Directory>/tidygetcleandata.txt", header = TRUE)
View(data)


Project Background Information Summary:
(Full background information and citations can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones )

Human Activity Recognition Using Smartphones Dataset
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

Feature Selection:
he features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

