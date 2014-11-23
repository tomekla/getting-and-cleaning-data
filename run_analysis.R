# Getting and Cleansing Data Project
# L.A. Tomek

library(dplyr)
library(foreach)

# Setup directory names and working directory 
#fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
localZipFile <- "getdata-projectfiles-UCI HAR Dataset.zip"

#mydir <- "/Users/a552951/coursera/getting-and-cleaning-data/project/gitrepos"
#if (!file.exists(mydir))
#  dir.create(mydir)
#setwd(mydir)
mydir<- "."              # current working directory 
ucidir <- paste(mydir,"/UCI Har Dataset",sep="")
traindir <- paste(ucidir,"/train",sep="")
testdir <- paste(ucidir,"/test",sep="")

# Download Zip File and Unzip

#download.file(fileUrl,destfile = localZipFile,mode="wb",method="curl")
unzip(localZipFile) 
list.files(".")

# record date downloaded
#dateDownloaded <- date()

# Read Datasets and Assign column labels based on the files provided in the Zip.
# Labels are assigned immediately on read of dataset to prevent a variety of 
# bugs associated with reordering columns and to makes the code clearer
# and less error prone than using column names that begin with X. 

features <- tbl_df(read.table(paste(ucidir,"/features.txt",sep=""),
  header=FALSE,sep="",strip.white=TRUE,stringsAsFactors=FALSE,skipNul=TRUE))
names(features)<-c("feature.number","feature.name")

activityLabels <- tbl_df(read.table(paste(ucidir,"/activity_labels.txt",sep=""),
  header=FALSE,sep="",strip.white=TRUE,stringsAsFactors=FALSE,skipNul=TRUE))
names(activityLabels)<-c("activity.number","activity.label")

subjecttest <- tbl_df(read.table(paste(testdir,"/subject_test.txt",sep=""),
  header=FALSE,sep="",strip.white=TRUE,stringsAsFactors=FALSE))
names(subjecttest)<-c("subject.id")

xtest <- tbl_df(read.table(paste(testdir,"/X_test.txt",sep=""),
  header=FALSE,sep="",strip.white=TRUE,stringsAsFactors=FALSE,skipNul=TRUE))
# remove duplicates in feature names  
names(xtest)<-make.unique(features$feature.name)  

ytest <- tbl_df(read.table(paste(testdir,"/Y_test.txt",sep=""),
  header=FALSE,sep="",strip.white=TRUE,stringsAsFactors=FALSE))
names(ytest)<-c("activity.number")

subjecttrain <- tbl_df(read.table(paste(traindir,"/subject_train.txt",sep=""),
  header=FALSE,sep="",strip.white=TRUE,stringsAsFactors=FALSE))
names(subjecttrain)<-c("subject.id")

xtrain <- tbl_df(read.table(paste(traindir,"/X_train.txt",sep=""),
  header=FALSE,sep="",strip.white=TRUE,stringsAsFactors=FALSE))
# set feature names to those provided in features.txt, remove duplicates
names(xtrain)<-make.unique(features$feature.name)

ytrain <- tbl_df(read.table(paste(traindir,"/Y_train.txt",sep=""),
  header=FALSE,sep="",strip.white=TRUE,stringsAsFactors=FALSE))
names(ytrain)<-c("activity.number")

# testdata includes subject_number, xtest features, and the ytest class value 
testdata <- cbind(subjecttest,xtest,ytest)

# traindata includes subject_number, xtrain features, and the ytrain class value 
traindata <- cbind(subjecttrain,xtrain,ytrain)

# 1. Merges the training and the test sets to create one data set. 
# Merge is just appending rows of traindata onto rows of testdata.  Datasets
# have identical columns.

data <- rbind_list(testdata,traindata)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# It is unclear whether this means only feature names that end with mean() and std() or 
# those that include mean() and std() in the middle of the feature name. 
# As it is not possible to ask, I opted to assume the latter.  

data <- data %>%
  select(subject.id,contains("mean()"),contains("std()"),activity.number)

# 3. Uses descriptive activity names to name the activities in the data set

data <- data %>%
  mutate(activity.name=tolower(activityLabels$activity.label[activity.number]))

# 4. Appropriately labels the data set with descriptive variable names. 
# Original feature names are structured, used structure to build descriptive name 

transformFeatureName <- function(f) {
  if (any(f=="activity.name",f=="activity.number",f=="subject.id"))
    fname=f
  else {
    s<-strsplit(f,split="-",fixed=T)
    s<-strsplit(s[[1]],"\\.")
    ismean=any(s=="mean()")                 #is mean
    isstd=any(s=="std()")                   #is std
    isX=any(s=="X")                         #is X-direction
    isY=any(s=="Y")                         #is Y-direction
    isZ=any(s=="Z")                         #is Z-direction
    isMag=!(any(isX,isY,isZ))               #is Magnitude
    firstPart<-s[[1]]                       #firstPart (e.g., fBodyAcc)
    
    isTime=(substr(firstPart,1,1)=="t")     #is Time Domain 
    isFreq=(substr(firstPart,1,1)=="f")     #is Frequency Domain 
    isBody=grepl("Body",firstPart)          #is Body
    isGravity=grepl("Gravity",firstPart)    #is Gravity 
    isAcc=grepl("Acc",firstPart)            #is Acceleration     
    isGyro=grepl("Gyro",firstPart)          #is Gyro 
    isJerk=grepl("Jerk",firstPart)          #is Jerk
    
    #build meaningful feature name  
    fname=""
    if(ismean) fname=paste(fname,"mean",sep="")
    if(isstd) fname=paste(fname,"standarddeviation",sep="")
    if(isBody) fname=paste(fname,".body",sep="")
    if(isGravity) fname=paste(fname,".gravity",sep="")
    if(isGyro) fname=paste(fname,".angularvelocity",sep="")
    if(isAcc) fname=paste(fname,".acceleration",sep="")
    if(isJerk) fname=paste(fname,".jerk",sep="")
    if(isX) fname=paste(fname,".xdirection",sep="")
    if(isY) fname=paste(fname,".ydirection",sep="")
    if(isZ) fname=paste(fname,".zdirection",sep="")
    if(isMag) fname=paste(fname,".magnitude",sep="")
    if(isTime) fname=paste(fname,".timedomain",sep="")
    if(isFreq) fname=paste(fname,".frequencydomain",sep="")
  }
  # return meaningful feature name 
  fname
}

featureList<-names(data)
newFeatureList <- foreach(f=featureList, .combine='c', .inorder=TRUE) %do% 
  transformFeatureName(f)

names(data)<-newFeatureList

# write merged data to file
write.table(data,"mergeddata.txt",row.name=FALSE)

# 5. From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

newTidyData <- 
  data %>%
  filter(!is.na(activity.number)) %>%
  filter(!is.na(activity.name)) %>%
  filter(!is.na(subject.id)) %>%
  arrange(subject.id,activity.number,activity.name) %>%
  select(-activity.number) %>%
  group_by(subject.id,activity.name) %>%
  summarise_each(funs(mean),-subject.id,-activity.name) 

# write newTidyData to file
write.table(newTidyData,"tidydata.txt",row.name=FALSE)