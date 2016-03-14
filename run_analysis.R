# This script does the following as decribed in the Getting and Cleaning Course Project description:

# 1.Merges the training and the test sets to create one data set.
# 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3.Uses descriptive activity names to name the activities in the data set
# 4.Appropriately labels the data set with descriptive variable names. 
# 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#### Load Required Libraries ####
library(dplyr)
library(readr) # to output tidy data file

#### read in text files #### 

## measurement values, subjects, activites in training set with their dimensions ##
train_values = read.table("./train/X_train.txt") # Training set - dim 7352 x 561
train_activity = read.table("./train/y_train.txt") # Training activity labels - dim 7352  x  1
subject_train = read.table("./train/subject_train.txt") # dim 7352  x  1

## measurement values, subjects, activites in test set with their dimensions ##
test_values = read.table("./test/X_test.txt") #  Test set - dim 2947 x 561
test_activity = read.table("./test/y_test.txt") # Test activity levels - dim 2947 x 1
subject_test = read.table("./test/subject_test.txt") # dim 2947 x 1


## names of variables that need to be assigned as column names ##
variable_names = read.table("./features.txt", stringsAsFactors = FALSE) # dim 561 x 2

#### add activity and subject as new columns
train = cbind(subject_train, train_activity, train_values) # dim 7352 x 563 
test = cbind(subject_test, test_activity, test_values) # dim 2947 x 563


#### Step 1. merge training and test files ####
train_and_test = rbind(train, test) # dim # 10299  x 563 
head(names(train_and_test)) # "V1"   "V1"   "V1"   "V2"   "V3"   "V4"


## Step 3. convert activity codes to activity names
train_and_test$activity[train_and_test$activity == "1"] = "walking"
train_and_test$activity[train_and_test$activity == "2"] = "walking_upstairs"
train_and_test$activity[train_and_test$activity == "3"] = "walking_downstairs"
train_and_test$activity[train_and_test$activity == "4"] = "sitting"
train_and_test$activity[train_and_test$activity == "5"] = "standing"
train_and_test$activity[train_and_test$activity == "6"] = "laying"


#### Step 4. add variable names to test/train file
names(train_and_test)[1] = "subject"
names(train_and_test)[2] = "activity"
names(train_and_test)[1:5] # [1] "subject" "activity"       "V1"       "V2"       "V3"
variable_names = variable_names[, 2] # subset variable_names to second column
names(train_and_test)[3:563] = variable_names
train_and_test = train_and_test[, !duplicated(names(train_and_test))] # subset out duplicate var names


#### Step 2. extract only mean and standard deviation for each measurement

## These are two ways to select for the columns with mean() and sd() ##
## Way #1 - retains original order of columns by subsetting using indexes

mean_grep = grep("mean()", names(train_and_test)) # find column variables with mean
mean_freq_grep = grep("mean[Ff]req()", names(train_and_test)) # find meanFreq() so can leave out
std_grep = grep("std()", names(train_and_test)) # find column variables with standard deviation
mean_sd = train_and_test[, c(1:8, 43:48, 83:88, 123:128, 163:168, 203:204, 216:217, 229:230, 242:243, 255:256, 268:273, 319:324, 370:375, 421:422, 434:435, 447:448, 460:461)]
length(mean_sd)

## Way #2 - does not retain original ordering of columns, puts mean() containing columns 1st ##
## using dplyr select ##
mean_sd2 = train_and_test %>%
    select(c(1:2, contains("mean()"), contains("std()"))) # extract vars with mean and sd


#### Step 5. create 2nd tidy data set w/ ave of each variable by each activity and each subject
## created 2, one with original order of columns (mean_sd) and one not (mean_sd2)

tidy_data = tbl_df(mean_sd) %>%
    group_by(subject, activity) %>%
    summarize_each(funs(mean))

tidy_data2 = tbl_df(mean_sd2) %>%
    group_by(subject, activity) %>%
    summarize_each(funs(mean))

# tidy_data_out = write_csv(tidy_data, "./tidy_data.csv", na = "NA", append = FALSE, 
                            col_names = TRUE)

# tidy_data_out2 = write_csv(tidy_data2, "./tidy_data2.csv", na = "NA", append = FALSE, 
                          col_names = TRUE)
write.table(tidy_data, "./tidy_data.txt", row.names = FALSE) 
