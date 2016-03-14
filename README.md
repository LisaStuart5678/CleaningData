# CleaningData: My final project for tidying a data set in my Getting and Cleaning Data course

This ReadMe document describes the files found in this project, how they are connected, and the explicit and exact steps taken to get from raw data to the tidy data sets.
    
This dataset includes the following files:
=========================================
    1. Raw data 
        a. Training set - measurement values for variables in train (X-train.txt)
        b. Test set - measurement values for variables in test (X_test.txt)
        c. Y train - vector of activity codes for train set (y_train.txt)
        d. Y test - vector of activity codes for test set (y_test.txt)
        e. Subject train - vector that identifies the subject who performed the activity in the training sample (subject_train.txt)
        f. Subject test - vector that identifies the subject who performed the activity in the test sample (subject_test.txt)
        g. Variable names - List of all features/variables (features.txt)
        h. Variable description - Shows information about the variables used on the feature vector. (features_info.txt)
        i. Activity labels - Links the activity codes with their activity name (activity_labels.txt)
    2. Tidy data
        a. tidydata.csv - A tidy data set containing the average values of the mean and standard deviation measurements for each subject grouped by activity.  This tidy data set has variable columns that are in the same order as the original data.
        b. tidydata2.csv - A tidy data set containing the average values of the mean and standard deviation measurements for each subject grouped by activity.  This tidy data set has variable columns that are not in the same order as the original data, rather with the mean values first followed by the standard deviation values.
    3. README.md
    4. CodeBook.md - Shows detailed information about the variables used in the tidy data sets tidy_data.csv and tidy_data2.csv.
    5. SessionInfo.Rmd - Gives detail on Session Information such as packages and versions used in R for this project.
        
Steps completed to acquire and tidy the dataset:
===============================================
    1. Download the "Human Activity Recognition Using Smartphones Dataset - Version 1.0" zip file from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    2. Created run_analysis.R script to perform data wrangling in order to output tidy data set
        a. Load Required Libraries
            I. dplyr
            II. readr
        b. Read in 7 text files as data frames and make note of their dimensions (to ensure proper final dimensions in merged data set)
            I. Train values (X-train.txt)
            II. Train activity (y_train.txt)
            III. Train subjects (subject_train.txt)
            IV. Test values (X_test.txt)
            V. Test activity (y_test.txt)
            VI. Test subjects (subject_test.txt)
            VII. Variable names (features.txt)
        c. Prepare 7 files for merging into 1 final data frame
            I. Merge subject and activity data frames to respective test and train data frames (from 6 data frames down to 2)
            II. Merge test and train data frames (2 data frames down to 1) - this is commented as Step 1 in run_analysis.R script
            III. Convert activity codes to activity names - this is commented as Step 3 in run_analysis.R script
            IV. Assign variable names to train_and_test data frame - this is commented as Step 4 in run_analysis.R script
        d. Extract the mean and standard deviation variable columns - this is commented as Step 2 in run_analysis.R script
            I. Extracted using indexing to retain original variable ordering
            II. Extracted using dplyr's select which does not retain original variable ordering
        e. Create 2nd tidy data set w/ ave of each variable by each activity and each subject - this is commented as Step 5 in run_analysis.R script
            I. tidy_data
            II. tidy_data2
        f. Output tidy data sets for submission along with other files