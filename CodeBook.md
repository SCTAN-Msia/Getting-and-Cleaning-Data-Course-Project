## CodeBook for Project Name: Getting-and-Cleaning-Data-Course-Project
## Name: Tan Siu Ching

## Session Info
R version 4.0.2 (2020-06-22)
Platform: x86_64-w64-mingw32/x64 (64-bit)
Running under: Windows 10 x64 (build 18362)

## Data Descriptions
Human Activity Recognition Using Smartphones Dataset *Version 1.0*
by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto, Smartlab - Non Linear Complex Systems Laboratory, 
DITEN - Università degli Studi di Genova, is use to demonstrate this analysis. Data is collected through a series of experiments 
to a group of 30 volunteers within an age bracket of 19-48 years by performing six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist.

Records it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

### Measurements
Feature Selection 
1. Accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.  
2. Time domain signals (prefix 't' to denote time) - captured at a constant rate of 50 Hz. A noise deduction filter process is done using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz.  
3. The acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.  
4. And then the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ).  
5. Magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).  
6. A Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).  

The set of variables that were estimated from these signals are:  
mean(): Mean value  
std(): Standard deviation  
mad(): Median absolute deviation   
max(): Largest value in array  
min(): Smallest value in array  
sma(): Signal magnitude area  
energy(): Energy measure. Sum of the squares divided by the number of values.   
iqr(): Interquartile range  
entropy(): Signal entropy  
arCoeff(): Autorregresion coefficients with Burg order equal to 4  
correlation(): correlation coefficient between two signals  
maxInds(): index of the frequency component with largest magnitude  
meanFreq(): Weighted average of the frequency components to obtain a mean frequency  
skewness(): skewness of the frequency domain signal   
kurtosis(): kurtosis of the frequency domain signal   
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.  
angle(): Angle between to vectors.  

Additional vectors: 
gravityMean  
tBodyAccMean  
tBodyAccJerkMean  
tBodyGyroMean  
tBodyGyroJerkMean  

###The dataset includes the following files:  
1.	'features_info.txt': Shows information about the variables used on the feature vector.  
2.	'features.txt': List of all features.  
3.	'activity_labels.txt': Links the class labels with their activity name.  
4.	'train/X_train.txt': Training set.  
5.	'train/y_train.txt': Training labels.  
6.	'test/X_test.txt': Test set.  
7.	'test/y_test.txt': Test labels.  

###The following files are available for the train and test data. Their descriptions are equivalent. 
1.	'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.  
2.	'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'.  
     Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and  'total_acc_z_train.txt' files for the Y and Z axis. 
3.	'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.   
4.	'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.  

###Notes: 
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.  

__**For more information about this dataset contact: activityrecognition@smartlab.ws**__

### Original data sources:  
[link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#)  

## Final Tidy Data 
New set of Tidy and cleaned data set is produced by using the R cade named TidyDataCode.R, which is saved and named as TidyDataSet.txt.  
TidyDataSet.txt contains 180 observations with 68 variables which only the measurements on the mean and standard deviation for each measurement.

