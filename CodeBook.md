This assignment involved writing an R script to download, work with and clean data. This is all part of the run_analysis.R file broken down as follows:

### 1.  Download the data

Once the zip file is downloaded and unzipped, all the data is stored under the folder 'UCI HAR Dataset'

### 2. Copy data from the files into variables

**activity_labels:** Contains data copied from the file activity_labels.txt in the *'UCI HAR Dataset'* folder. This data contains list of 6 activities performed when measurements were taken. Number of rows: 6, Number of columns: 2, Units of column1 (code): Numeric, Units of column2 (activity): text

**features:** Contains data copied from the file features.txt in the *'UCI HAR Dataset'* folder. The data contains features selected for this database that are derived from accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. Number of rows: 561, Number of columns: 2, Units of column1(num): Numeric, Units of column2(funcs): text

**subject_train:** Contains data copied from the file subject_train.txt in the *'UCI HAR Dataset/train'* folder. The data contains identfication of training subjects under observation that performed an activity. Number of rows: 7352, Number of columns: 1, Units of column1(subject): Numeric.

**x_train:** Contains data copied from the file X_train.txt in the *'UCI HAR Dataset/train'* folder. This contains data from the training set. Number of rows: 7352, Number of columns:561, Units of all columns: Decimal.

**y_train:** Contains data copied from the file y_train.txt in the *'UCI HAR Dataset/train'* folder'. This contains activity code labels of training data. Number of rows: 7352, Number of columns: 1, Units of column1(code): Numeric.

**subject_test:** Contains data copied from the file subject_test.txt in the *'UCI HAR Dataset/test'* folder. The data contains identfication of test subjects under observation that performed an activity. Number of rows: 2947, Number of columns: 1, Units of column1(subject): Numeric.

**x_test:** Contains data copied from the file X_test.txt in the *'UCI HAR Dataset/test'* folder. This contains data from the test set. Number of rows: 2947, Number of columns:561, Units of all columns: Decimal.

**y_test:** Contains data copied from the file y_test.txt in the *'UCI HAR Dataset/test'* folder'. This contains activity code labels of test data. Number of rows: 2947, Number of columns: 1, Units of column1(code): Numeric.

### 3. Merge the training and test data to create one data set
#### 3.1 
Tables from the training data are merged to create train_data (via merging subject_train, y_train and x_train) using cbind(). Resulting table (train_data) has 7352 rows and 563 columns

#### 3.2 
Tables from the test data are merged to create test_data (via merging subject_test, y_test and x_test) using cbind(). Resulting table (test_data) has 2947 rows and 563 columns.

#### 3.3 
Merge the train_data and test_data creating merge_data with 10299 rows and 563 columns. This is done using the rbind() function.

### 4. Filter merge_data to include only variables for mean and standard deviation

**extracted_data** is created with 10299 rows and 88 columns by selecting the subject, code and columns that contain mean and standard deviation measurements.

### 5. Change activity labels to use more descriptive names.
Change the values of the code column from numbers to text title based on mapping in the **activity_labels** file.

### 6. Label the extracted_data data set with descriptive variable names. The following variable names were changed:
"code" changes to "Activity"

All columns with "tBody" changed to "TimeBody"

All columns with "Acc" changed to "Accelerometer"

All columns with "mean" changed to "Mean"

All columns with "std" changed to "STD"

All columns with "tGravity" changed to "TimeGravity"

All columns with "Gyro" changed to "Gyroscope"

All columns with "Mag" changed to "Magnitude"

All columns with "fBody" changed to "FrequencyBody"

All columns with "Freq" changed to "Frequency"

### 7. Create a second independent data set (mean_data) from the data set

**extracted_data** that contains average of each variable grouped by subject and activity. **mean_data** that contains 180 rows and 88 columns is derived from **extracted_data** by first grouping **extracted_data** based on subject and activity followed by taking mean of each variable.

### 8. Write mean_data to a text file (meanData.txt)
