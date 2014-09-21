#Merges the training and the test sets to create one data set.
getwd()
setwd("/home/kasia/Pulpit/kurs R/UCI HAR Dataset/test")
subject_test=read.table("subject_test.txt")
Y_test=read.table("y_test.txt")
X_test=read.table("X_test.txt")
test_data=cbind(subject_test, Y_test,X_test)
test_data[1:3,1:4]

setwd("/home/kasia/Pulpit/kurs R/UCI HAR Dataset/train")

subject_train=read.table("subject_train.txt")
Y_train=read.table("y_train.txt")
X_train=read.table("X_train.txt")
train_data=cbind(subject_train, Y_train,X_train)
data_set=rbind(train_data,test_data)

#Extracts only the measurements on the mean 
#and standard deviation for each measurement.

setwd("/home/kasia/Pulpit/kurs R/UCI HAR Dataset")
features=read.table("features.txt")
list<- as.character(features[,2])


#Appropriately labels the data set with descriptive variable names. 

names(data_set)<-c("subject","activity",list )

#Uses descriptive activity names to name the activities in the data set

activity_labels<-read.table("activity_labels.txt")
data=merge(activity_labels,data_set, by.x="V1", by.y="activity", all=TRUE)

names<-names(data)
data1=data[,c(3,2,grep("mean()",names),grep("std()",names))]

class(data1$subject)<-"character"

#data2<-ddply(data1,c("subject","V2"), numcolwise(mean))

#write.table(data2, file="data.txt", row.name=FALSE)
