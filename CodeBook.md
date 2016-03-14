# The goal of this project named CleaningData is to create a tidy data set that is a subset of the "Human Activity Recognition Using Smartphones Dataset - Version 1.0".

A tidy data set is one where:
1.	Each variable forms a column
2.	Each observation forms a row
3.	Each type of observational unit forms a table
 
    
The Data:
========
The "Human Activity Recognition Using Smartphones Dataset - Version 1.0" data set represent data collected from the accelerometers from the Samsung Galaxy S smartphone.

The raw data for the "Human Activity Recognition Using Smartphones Dataset"  came in a zip file ("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and were in several different text files that had to be 'wrangled' so that a tidy data set could be created from them.  See README.md for more specific details.

Feature (Variable) Selection: 
============================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. The time domain signals have a prefix 't' to denote time.  The acceleration signal was separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ). 

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

There were several variable values that were estimated from these signals, however only the following were wanted in the final tidy data set and so were subset from the 'munged' data set: 

mean(): Mean value
std(): Standard deviation

This resulted in the following set of feature/variable names and values that are found in the tidy data sets named tidy_data.csv and tidy_data2.csv:

1.	subject
2.	activity
3.	tBodyAcc-mean()-X          
4.	tBodyAcc-mean()-Y           
5.	tBodyAcc-mean()-Z           
6.	tBodyAcc-std()-X           
7.	tBodyAcc-std()-Y            
8.	tBodyAcc-std()-Z            
9.	tGravityAcc-mean()-X       
10.	tGravityAcc-mean()-Y        
11.	tGravityAcc-mean()-Z        
12.	tGravityAcc-std()-X        
13.	tGravityAcc-std()-Y         
14.	tGravityAcc-std()-Z         
15.	tBodyAccJerk-mean()-X      
16.	tBodyAccJerk-mean()-Y       
17.	tBodyAccJerk-mean()-Z       
18.	tBodyAccJerk-std()-X       
19.	tBodyAccJerk-std()-Y        
20.	tBodyAccJerk-std()-Z        
21.	tBodyGyro-mean()-X         
22.	tBodyGyro-mean()-Y          
23.	tBodyGyro-mean()-Z          
24.	tBodyGyro-std()-X          
25.	tBodyGyro-std()-Y           
26.	tBodyGyro-std()-Z           
27.	tBodyGyroJerk-mean()-X     
28.	tBodyGyroJerk-mean()-Y      
29.	tBodyGyroJerk-mean()-Z      
30.	tBodyGyroJerk-std()-X      
31.	tBodyGyroJerk-std()-Y       
32.	tBodyGyroJerk-std()-Z       
33.	tBodyAccMag-mean()         
34.	tBodyAccMag-std()           
35.	tGravityAccMag-mean()       
36.	tGravityAccMag-std()       
37.	tBodyAccJerkMag-mean()      
38.	tBodyAccJerkMag-std()       
39.	tBodyGyroMag-mean()        
40.	tBodyGyroMag-std()          
41.	tBodyGyroJerkMag-mean()     
42.	tBodyGyroJerkMag-std()     
43.	fBodyAcc-mean()-X           
44.	fBodyAcc-mean()-Y           
45.	fBodyAcc-mean()-Z          
46.	fBodyAcc-std()-X            
47.	fBodyAcc-std()-Y            
48.	fBodyAcc-std()-Z           
49.	fBodyAccJerk-mean()-X       
50.	fBodyAccJerk-mean()-Y       
51.	fBodyAccJerk-mean()-Z      
52.	fBodyAccJerk-std()-X        
53.	fBodyAccJerk-std()-Y        
54.	fBodyAccJerk-std()-Z       
55.	fBodyGyro-mean()-X          
56.	fBodyGyro-mean()-Y          
57.	fBodyGyro-mean()-Z         
58.	fBodyGyro-std()-X           
59.	fBodyGyro-std()-Y           
60.	fBodyGyro-std()-Z          
61.	fBodyAccMag-mean()          
62.	fBodyAccMag-std()           
63.	fBodyBodyAccJerkMag-mean() 
64.	fBodyBodyAccJerkMag-std()   
65.	fBodyBodyGyroMag-mean()     
66.	fBodyBodyGyroMag-std()     
67.	fBodyBodyGyroJerkMag-mean() 
68.	fBodyBodyGyroJerkMag-std()

Note: tidy_data2.csv are not in this order, rather all variables with mean() are first followed by variables with std().

[For details on the variable names and values in the original data set, see features.txt and features_info.txt in the Raw Data folder]