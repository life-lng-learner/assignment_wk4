library(dplyr)

filename<-"UCI HAR Dataset.zip"

#Download zip file if not already done
if(!file.exists(filename)){
  furl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(furl,filename,method="curl")
}

#Check if file has been unzipped before unzipping
if(!file.exists("UCI HAR Dataset")){
  unzip(filename)
}

##Assign data frames
#Read activity labels and functions
activity_labels<-read.table("./UCI HAR Dataset/activity_labels.txt",col.names = c("code","activity"))
features<-read.table("./UCI HAR Dataset/features.txt",col.names=c("num","funcs"))

#Read test data
subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt",col.names=c("subject"))
x_test<-read.table("./UCI HAR Dataset/test/X_test.txt",col.names=features$funcs)
y_test<-read.table("./UCI HAR Dataset/test/y_test.txt",col.names=c("code"))

#Read training data
subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt",col.names=c("subject"))
x_train<-read.table("./UCI HAR Dataset/train/X_train.txt",col.names=features$funcs)
y_train<-read.table("./UCI HAR Dataset/train/y_train.txt",col.names=c("code"))

##1.Merges the training and the test sets to create one data set.
#Merge tables from the training data
train_data<-cbind(subject_train,y_train,x_train)

#Merge tables from the test data set
test_data<-cbind(subject_test,y_test,x_test)

#Merge the training and test data sets
merge_data<-rbind(train_data,test_data)

##2.Extracts only the measurements on the mean and standard deviation for each measurement.
extracted_data<-merge_data %>% select(subject,code,matches('mean|std'))

##3.Uses descriptive activity names to name the activities in the data set
extracted_data$code<-activity_labels[extracted_data$code,2]

##4. Appropriately labels the data set with descriptive variable names.
names(extracted_data)<-gsub("code","Activity",names(extracted_data))
names(extracted_data)<-gsub("tBody","TimeBody",names(extracted_data))
names(extracted_data)<-gsub("Acc","Accelerometer",names(extracted_data))
names(extracted_data)<-gsub("mean","Mean",names(extracted_data))
names(extracted_data)<-gsub("std","STD",names(extracted_data))
names(extracted_data)<-gsub("tGravity","TimeGravity",names(extracted_data))
names(extracted_data)<-gsub("Gyro","Gyroscope",names(extracted_data))
names(extracted_data)<-gsub("Mag","Magntude",names(extracted_data))
names(extracted_data)<-gsub("fBody","FrequencyBody",names(extracted_data))
names(extracted_data)<-gsub("Freq","Frequency",names(extracted_data))

##5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
mean_data<-extracted_data %>% group_by(subject,Activity) %>% summarise_all(funs(mean))

##Writing data to a text file
write.table(mean_data,"meanData.txt",row.name=FALSE)