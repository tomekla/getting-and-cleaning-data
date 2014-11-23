#Code Book for Getting and Cleaning Data Project

**Author:** L.A. Tomek

**Date:** November 20, 2014

## Overview

This document is a detailed description of the transformation process to cleanup data on Human Activity measurements using smartphones.  

The site where the data was originally posted: 

- [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]

The site where the data from this project was downloaded: 

- [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip]

The download date:  November 20, 2014 

## Transformation Process

The run_analysis.R script performs the following steps to clean the data:

- Unzip the previously downloaded file "getdata-projectfiles-UCI HAR Dataset.zip" in the working directory to subdirectory "/UCI Har Dataset"
- Read names of the features in file "features.txt" into data table features.  Name the columns: "feature.number" and "feature.name".
- Read human readable names of the activity labels in file "activity_labels.txt" into data table activityLabels.  Name the columns: "activity.number" and "activity.label"
- Read the subject number being measured in the test data in file "subject_test.txt" into data frame subjecttest.  Name the column:  "subject.id"
- Read the X-train data from file "X_train.txt" and the Y-train data from file "Y_train.txt" into xtrain and ytrain respectively.
- Read the subject number being measured in the train data in file "subject_train.txt" into data frame subjecttest.  Name the column:  "subject.id"
- Read the X-test data from file "X_test.txt" and the Y-test data from file "Y_test.txt" into xtest and ytest respectively.
- Concatenate by column the subjecttest, xtest, and ytest data frames into a single data frame called testdata, representing a unified view of all measured data in the test set. 
- Concatenate by column the subjecttrain, xtrain, and ytrain data frames into a single data frame called traindata, representing a unified view of all measured data in the train set. 
- Merge the training and test datasets into a single dataset by appending rows;  the new single unified dataset is called data.
- Extract only the measurements on the mean and standard deviation from the unified dataset.  
- Add a human readable activity.name in the unified dataset indicating if the activity is "walking", etc.
- Label the unified dataset with descriptive variable names, without special characters, etc. 
- Write this merged dataset to a CSV file named "mergeddata.csv"
- Create a second tidy dataset which has a single row for each subject.id and activity.name and measurements that are the averages of each measurement instance in the original merged data.  
- Write the tidy dataset to a CSV filed named "tidydata.csv"


## Data Dictionary 

### subject.id 

Identifier of person being measured.

Type:  Integer

Valid Range:  [1..30]

### activity.name 

Identifier of the activity the person was doing when measured.

Type: String

The following are the valid values:  

- walking
- walking_upstairs
- walking_downstairs
- sitting
- standing
- laying

### mean.body.acceleration.xdirection.timedomain

Mean acceleration of the body in the X-axis direction, measured in the time domain.

Type:  Double

### mean.body.acceleration.ydirection.timedomain

Mean acceleration of the body in the Y-axis direction, measured in 
the time domain.

Type:  Double

### mean.body.acceleration.zdirection.timedomain

Mean acceleration of the body in the Z-axis direction, measured in 
the time domain.

Type:  Double

### mean.gravity.acceleration.xdirection.timedomain

Mean of gravity acceleration in the X-axis direction, measured in the time domain.

Type:  Double

### mean.gravity.acceleration.ydirection.timedomain

Mean of gravity acceleration in the Y-axis direction, measured in the time domain.

Type:  Double

### mean.gravity.acceleration.zdirection.timedomain 

Mean of gravity acceleration in the Z-axis direction, measured in the time domain.

Type:  Double

### mean.body.acceleration.jerk.xdirection.timedomain

Mean body jerk acceleration in the X-axis direction, measured in the time domain. 

Type:  Double

### mean.body.acceleration.jerk.ydirection.timedomain 

Mean body jerk acceleration in the Y-axis direction, measured in the time domain. 

Type:  Double

### mean.body.acceleration.jerk.zdirection.timedomain

Mean body jerk acceleration in the Z-axis direction, measured in the time domain. 

Type:  Double

### mean.body.angularvelocity.xdirection.timedomain

Mean body angular velocity in the X-axis direction, measured in the time domain. 

Type:  Double

### mean.body.angularvelocity.ydirection.timedomain

Mean body angular velocity in the Y-axis direction, measured in the time domain.

Type:  Double

### mean.body.angularvelocity.zdirection.timedomain

Mean body angular velocity in the Z-axis direction, measured in the time domain.

Type:  Double

### mean.body.angularvelocity.jerk.xdirection.timedomain

Mean body jerk angular velocity in the X-axis direction, measured in the time domain.

Type:  Double

### mean.body.angularvelocity.jerk.ydirection.timedomain

Mean body jerk angular velocity in the Y-axis direction, measured in the time domain.

Type:  Double

### mean.body.angularvelocity.jerk.zdirection.timedomain

Mean body jerk angular velocity in the Z-axis direction, measured in the time domain.

Type:  Double

### mean.body.acceleration.magnitude.timedomain

Mean body acceleration magnitude measured in the time domain.

Type:  Double

### mean.gravity.acceleration.magnitude.timedomain 

Mean body gravity measured in the time domain.

Type:  Double


### mean.body.acceleration.jerk.magnitude.timedomain

Mean body acceleration jerk magnitude measured in the time domain.

Type:  Double

### mean.body.angularvelocity.magnitude.timedomain

Mean body angular velocity magnitude measured in the time domain.

Type:  Double

### mean.body.angularvelocity.jerk.magnitude.timedomain

Mean body angular velocity jerk magnitude measured in the time domain.

Type:  Double

### mean.body.acceleration.xdirection.frequencydomain

Mean body acceleration in the X-axis direction, measured in the frequency domain.

Type:  Double

### mean.body.acceleration.ydirection.frequencydomain

Mean body acceleration in the Y-axis direction, measured in the frequency domain.

Type:  Double

### mean.body.acceleration.zdirection.frequencydomain

Mean body acceleration in the Z-axis direction, measured in the frequency domain.

Type:  Double


### mean.body.acceleration.jerk.xdirection.freqdomain

Mean body jerk acceleration in the X-axis direction, measured in the frequency domain.

Type:  Double

### mean.body.acceleration.jerk.ydirection.freqdomain 

Mean body jerk acceleration in the Y-axis direction, measured in the frequency domain.

Type:  Double

### mean.body.acceleration.jerk.zdirection.freqdomain

Mean body jerk acceleration in the Z-axis direction, measured in the frequency domain.

Type:  Double

### mean.body.angularvelocity.xdirection.frequencydomain

Mean body angular velocity in the X-axis direction, measured in the frequency domain.

Type:  Double

### mean.body.angularvelocity.ydirection.frequencydomain

Mean body angular velocity in the Y-axis direction, measured in the frequency domain.

Type:  Double

### mean.body.angularvelocity.zdirection.frequencydomain

Mean body angular velocity in the Z-axis direction, measured in the frequency domain.

Type:  Double

### mean.body.acceleration.magnitude.frequencydomain

Mean body acceleration magnitude in the frequency domain.

Type:  Double

### mean.body.acceleration.jerk.magnitude.frequencydomain

Mean body jerk acceleration magnitude in the frequency domain.

Type:  Double

### mean.body.angularvelocity.magnitude.frequencydomain

Mean body angular velocity magnitude in the frequency domain.

Type:  Double

### mean.body.angularvelocity.jerk.magnitude.frequencydomain

Mean body angular velocity jerk magnitude in the frequency domain.

Type:  Double

### standarddeviation.body.acceleration.xdirection.timedomain

Standard Deviation of acceleration of the body in the X-axis direction, measured in the time domain.

Type:  Double

### standarddeviation.body.acceleration.ydirection.timedomain

Standard Deviation of acceleration of the body in the Y-axis direction, measured in 
the time domain.

Type:  Double

### standarddeviation.body.acceleration.zdirection.timedomain

Standard Deviation of acceleration of the body in the Z-axis direction, measured in 
the time domain.

Type:  Double

### standarddeviation.gravity.acceleration.xdirection.timedomain

Standard Deviation of gravity acceleration in the X-axis direction, measured in the time domain.

Type:  Double

### standarddeviation.gravity.acceleration.ydirection.timedomain

Standard Deviation of gravity acceleration in the Y-axis direction, measured in the time domain.

Type:  Double

### standarddeviation.gravity.acceleration.zdirection.timedomain

Standard Deviation of gravity acceleration in the Z-axis direction, measured in the time domain.

Type:  Double

### standarddeviation.body.acceleration.jerk.xdirection.timedomain

Standard Deviation of body jerk acceleration in the X-axis direction, measured in the time domain.

Type:  Double

### standarddeviation.body.acceleration.jerk.ydirection.timedomain

Standard Deviation of body jerk acceleration in the Y-axis direction, measured in the time domain.

Type:  Double

### standarddeviation.body.acceleration.jerk.zdirection.timedomain

Standard Deviation of body jerk acceleration in the Z-axis direction, measured in the time domain.

Type:  Double

### standarddeviation.body.angularvelocity.xdirection.timedomain

Standard Deviation of body angular velocity in the X-axis direction, measured in the time domain.

Type:  Double

### standarddeviation.body.angularvelocity.ydirection.timedomain

Standard Deviation of body angular velocity in the Y-axis direction, measured in the time domain.

Type:  Double

### standarddeviation.body.angularvelocity.zdirection.timedomain

Standard Deviation of body angular velocity in the Z-axis direction, measured in the time domain.

Type:  Double

### standarddeviation.body.angularvelocity.jerk.xdirection.timedomain

Standard Deviation of body jerk angular velocity in the X-axis direction, measured in the time domain.

Type:  Double

### standarddeviation.body.angularvelocity.jerk.ydirection.timedomain

Standard Deviation of body jerk angular velocity in the Y-axis direction, measured in the time domain.

Type:  Double

### standarddeviation.body.angularvelocity.jerk.zdirection.timedomain

Standard Deviation of body jerk angular velocity in the Z-axis direction, measured in the time domain.

Type:  Double

### standarddeviation.body.acceleration.magnitude.timedomain

Standard Deviation of body acceleration magnitude measured in the time domain.

Type:  Double

### standarddeviation.gravity.acceleration.magnitude.timedomain

Standard Deviation of gravity acceleration magnitude measured in the time domain.

Type:  Double

### standarddeviation.body.jerk.acceleration.magnitude.timedomain

Standard Deviation of body jerk acceleration magnitude measured in the time domain.

Type:  Double

### standarddeviation.body.angularvelocity.magnitude.timedomain

Standard Deviation of body angular velocity magnitude measured in the time domain.

Type:  Double

### standarddeviation.body.angularvelocity.jerk.magnitude.timedomain

Standard Deviation of body jerk angular velocity magnitude measured in the time domain.

Type:  Double

### standarddeviation.body.acceleration.xdirection.frequencydomain

Standard Deviation of acceleration of the body in the X-axis direction, measured in the frequency domain.

Type:  Double

### standarddeviation.body.acceleration.ydirection.frequencydomain

Standard Deviation of acceleration of the body in the Y-axis direction, measured in 
the frequency domain.

Type:  Double

### standarddeviation.body.acceleration.zdirection.frequencydomain

Standard Deviation of acceleration of the body in the Z-axis direction, measured in 
the frequency domain.

Type:  Double

### standarddeviation.body.acceleration.jerk.xdirection.frequencydomain

Standard Deviation of body jerk acceperation in the X-axis direction, measured in 
the frequency domain.

Type:  Double

### standarddeviation.body.acceleration.jerk.ydirection.frequencydomain

Standard Deviation of body jerk acceperation in the Y-axis direction, measured in 
the frequency domain.

Type:  Double

### standarddeviation.body.acceleration.jerk.zdirection.frequencydomain

Standard Deviation of body jerk acceperation in the Z-axis direction, measured in 
the frequency domain.

Type:  Double

### standarddeviation.body.angularvelocity.xdirection.frequencydomain

Standard Deviation of body angular velocity in the X-axis direction, measured in the frequency domain.

Type:  Double

### standarddeviation.body.angularvelocity.ydirection.frequencydomain

Standard Deviation of body angular velocity in the Y-axis direction, measured in the frequency domain.

Type:  Double

### standarddeviation.body.angularvelocity.zdirection.frequencydomain

Standard Deviation of body angular velocity in the Z-axis direction, measured in the frequency domain.

Type:  Double

### standarddeviation.body.acceleration.magnitude.frequncydomain

Standard Deviation of body acceleration magnitude measured in the frequency domain.

Type:  Double

### standarddeviation.body.acceleration.jerk.magnitude.frequencydomain

Standard Deviation of body jerk acceleration magnitude measured in the frequency domain.

Type:  Double

### standarddeviation.body.angularvelocity.magnitude.frequencydomain

Standard Deviation of body angular velocity magnitude measured in the frequency domain.

Type:  Double

### standarddeviation.body.angularvelocity.jerk.magnitude.frequencydomain

Standard Deviation of body jerk angular velocity magnitude measured in the frequency domain.

Type:  Double

