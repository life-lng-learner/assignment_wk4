### Peer-graded Assignment: Getting and Cleaning Data Course Project - README file

**Purpose:** The purpose of this project is to learn collecting, working with and cleaning a data set.

Details of the Human Activity Recogniition Using Smartphones Data Set can be found at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##### **Files submitted**

**run_analysis.R:** Analysis script that does the following:

1. Download and unzip data folder
2. Read in features, labels, test and training data
3. Merge the training and test data to create one data set
4. Extract measurements on the mean and standard deviation for each measurement.
5. Assign descriptive activity names for the activities int he data set.
6. Label data set with descriptive variable names.
7. Create a data set with the average of each variable for each activity and each subject.
8. Write the above data set to a text file

**meanData.txt:** This is the text file with the average of each variable for each activity and each subject (result of step#8 above).

**CodeBook.md:** A code book describing the analysis processes step by step and the key variables.