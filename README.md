
Transformations and work that I performed to clean up the data :
==========================================

Dataset Was organized in many files. To clen up the data and make one tidy dataset, I did the following :

- I merged the training and the test sets to create one data set (by using read.table() and cbind() functions).
- I extracted only the measurements on the mean and standard deviation for each measurement (by using grep() function).
- I used descriptive activity names to name the activities in the data set by merging data set with activity labels.
- I labeled the data set with descriptive variable names. 

