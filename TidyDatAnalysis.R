## Name: Tan Siu Ching (SCTAN)
## My Getting and Cleaning Data: Course Project

## Call library used
library(data.table)
library(dplyr)

## Download Data from Data Source URLs and create folder to store data

if(!file.exists("./data")){dir.create("./data")}
dataUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(dataUrl,destfile="./data/Dataset.zip",method="curl")

## Unzipped the dataset file and get the list of the files
unzip(zipfile="./data/Dataset.zip",exdir="./data")
path_rf <- file.path("./data" , "UCI HAR Dataset")
Listfiles<-list.files(path_rf, recursive=TRUE)
Listfiles

## Read dataset and assigned data into the variables

### Read the Fearures files
datFea_Test  <- read.table(file.path(path_rf, "test" , "X_test.txt" ),header = FALSE)
datFea_Train <- read.table(file.path(path_rf, "train", "X_train.txt"),header = FALSE)

### Read the Activity files
datAct_Test  <- read.table(file.path(path_rf, "test" , "Y_test.txt" ),header = FALSE)
datAct_Train <- read.table(file.path(path_rf, "train", "Y_train.txt"),header = FALSE)

### Read the Subject files
datSubj_Train <- read.table(file.path(path_rf, "train", "subject_train.txt"),header = FALSE)
datSubj_Test  <- read.table(file.path(path_rf, "test" , "subject_test.txt"),header = FALSE)


## Part 1:- Merges the training and the test sets to create one data set.
datSubj <- rbind(datSubj_Train, datSubj_Test)
datAct<- rbind(datAct_Train, datAct_Test)
datFea<- rbind(datFea_Train, datFea_Test)

### Renamed the merge dataset
names(datSubj)<-c("subject")
names(datAct)<- c("activity")
datFea_Names <- read.table(file.path(path_rf, "features.txt"),head=FALSE)
names(datFea)<- datFea_Names$V2

### Create data frame (Merga all data into one set)
datavalues <- cbind(datSubj, datAct)
DataAll <- cbind(datFea, datavalues)


## Part 2:- Extracts only the measurements on the mean [mean()] and standard deviation [std()]  
##          for each measurement.
DataExtracted <- DataAll 
sub_Fea_Names<-datFea_Names$V2[grep("mean\\(\\)|std\\(\\)", datFea_Names$V2)]
selectedNames<-c(as.character(sub_Fea_Names), "subject", "activity" )
DataExtracted<-subset(DataExtracted,select=selectedNames)


## Part 3:- Uses descriptive activity names to name the activities in the data set

Act_Labels  <- read.table(file.path(path_rf, "activity_labels.txt"),header = FALSE)
DataExtracted$activity <- Act_Labels$V2[ match(DataExtracted$activity, Act_Labels $V1 ) ]

## Part 4:- Appropriately labels the data set with descriptive variable names.

names(DataExtracted)<-gsub("^t", "time", names(DataExtracted))
names(DataExtracted)<-gsub("^f", "frequency", names(DataExtracted))
names(DataExtracted)<-gsub("Acc", "Accelerometer", names(DataExtracted))
names(DataExtracted)<-gsub("Gyro", "Gyroscope", names(DataExtracted))
names(DataExtracted)<-gsub("Mag", "Magnitude", names(DataExtracted))
names(DataExtracted)<-gsub("BodyBody", "Body", names(DataExtracted))


## Part 5:- From the data set in step 4, creates a second, independent tidy data set 
##          with the average of each variable for each activity and each subject.
DataExtracted2<-aggregate(. ~subject + activity, DataExtracted, mean)
DataExtracted2<-DataExtracted2[order(DataExtracted2$subject,DataExtracted2$activity),]
write.table(DataExtracted2, file = "./data/TidyDataSet.txt",row.name=FALSE)
