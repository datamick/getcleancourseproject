Data Dictionary – tidygetcleandata.txt

	SUBJECT
	Each row identifies the subject who performed the activity for each window sample.  Subjects are drawn from a 
     	group of 30 volunteers within an age bracket of 19-48 years old.  Its range is from 1 to 30.   

	ACTIVITIES
	Identifies activities that each subject performed.
1.	Laying
2.	Sitting
3.	Standing
4.	Walking
5.	Walking down stairs
6.	Walking up stairs

MEASUREMENT VARIABLES(MEAN AND STANDARD DEVIATIONS RELATED AVERAGES)*
These variables are the average of each variable for each activity and each subject.
	
1	tbodyaccmeanx
2	tbodyaccmeany
3	tbodyaccmeanz
4	tbodyaccstdx
5	tbodyaccstdy
6	tbodyaccstdz
7	tgravityaccmeanx
8	tgravityaccmeany
9	tgravityaccmeanz
10	tgravityaccstdx
11	tgravityaccstdy
12	tgravityaccstdz
13	tbodyaccjerkmeanx
14	tbodyaccjerkmeany
15	tbodyaccjerkmeanz
16	tbodyaccjerkstdx
17	tbodyaccjerkstdy
18	tbodyaccjerkstdz
19	tbodygyromeanx
20	tbodygyromeany
21	tbodygyromeanz
22	tbodygyrostdx
23	tbodygyrostdy
24	tbodygyrostdz
25	tbodygyrojerkmeanx
26	tbodygyrojerkmeany
27	tbodygyrojerkmeanz
28	tbodygyrojerkstdx
29	tbodygyrojerkstdy
30	tbodygyrojerkstdz
31	tbodyaccmagmean
32	tbodyaccmagstd
33	tgravityaccmagmean
34	tgravityaccmagstd
35	tbodyaccjerkmagmean
36	tbodyjerkmagstd
37	tbodygyromagmean
38	tbodygyromagstd
39	tbodygyrojerkmagmean
40	tbodygyrojerkmagstd
41	fbodyaccmeanx
42	fbodyaccmeany
43	fbodyaccmeanz
44	fbodyaccstdx
45	fbodyaccstdy
46	fbodyaccstdz
47	fbodyaccmeanfreqx
48	fbodyaccmeanfreqy
49	fbodyaccmeanfreqz
50	fbodyaccjerkmeanx
51	fbodyaccjerkmeany
52	fbodyaccjerkmeanz
53	fbodyaccjerkstdx
54	fbodyaccjerkstdy
55	fbodyaccjerkstdz
56	fbodyaccjerkmeanfreqx
57	fbodyaccjerkmeanfreqy
58	fbodyaccjerkmeanfreqz
59	fbodygyromeanx
60	fbodygyromeany
61	fbodygyromeanz
62	fbodygyrostdx
63	fbodygyrostdy
64	fbodygyrostdz
65	fbodygyromeanfreqx
66	fbodygyromeanfreqy
67	fbodygyromeanfreqz
68	fbodyaccmagmean
69	fbodyaccmagstd
70	fbodyaccmagmeanfreq
71	fbodyaccjerkmagmean
72	fbodyaccjerkmagstd
73	fbodyaccjerkmagmeanfreq
74	fbodygyromagmean
75	fbodygyromagstd
76	fbodygyromagmeanfreq
77	fbodygyrojerkmagmean
78	fbodygyrojerkmagstd
79	fbodygyrojerkmagmeanfreq
80	angletbodyaccmeangravity
81	angletbodyaccjerkmeangravitymean
82	angletbodygyromeangravitymean
83	angletbodygyrojerkmeangravitymean
84	anglexgravitymean
85	angleygravitymean
86	anglezgravitymean

* 	mean(): Mean value
std(): Standard deviation
meanFreq(): Weighted average of the frequency components to obtain a mean frequency

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
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
Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

