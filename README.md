## README for Getting and Cleaning Data Project

**Author:** L.A. Tomek 

**Date:** November 20, 2014


The purpose of the project is to download and clean data.  The main script is run_analysis.R. 

To execute the script do the following:  
  
- Download the zip file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and save to a known directory, say "data"
- The downloaded file should be named "getdata-projectfiles-UCI HAR Dataset.zip"
- Copy the run_analysis.R script to the same known directory (e.g., "data")
- Change directory such that "data" is the local directory.
- Source the script "run_analysis.R" in RStudio 	- source('~/run_analysis.R')
- You will find two output files are generated in the "data" directory 
	- mergeddata.txt: clean data with one row for each time a subject and activity was measured with each of the measured variables; this data is 10299*68 dimension
	- tidydata.txt: tidy data showing one row for each subject/activity tuple with averages for each of the measured variables; this data is 180*68 dimenion 
- You can read tidydata.txt in an editor of your choice, or read the data into R using tidydata<-read.table("./tidydata.txt").