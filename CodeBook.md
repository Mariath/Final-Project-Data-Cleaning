Data Dictionary
This tidy dataset was created based on the files with the information collected by Samsung company.

INFORMATION ABOUT THE DATASET:
The tidy dataset described in this Code Book was created using the following files:
+ ‘features.txt’: Shows information about the variables used on the feature vector.
+ ‘activity_labels.txt’: Links the class labels with their activity name.
+ ‘train/X_train.txt’: Training set.
+ ‘train/y_train.txt’: Training labels.
+ ‘test/X_test.txt’: Test set.
+ ‘test/y_test.txt’: Test labels.

The following files are available for the train and test data. Their descriptions are equivalent.
+ ‘train/subject_train.txt’: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

Note: Each feature vector is a row on the text file.


directory - the path to the working directory on my pc where all the files are placed
activity_labels - this is a list of labels that describe activity 
features - a dataframe containing names of all columns

subject_test - a subset of the test subject data
X_test - test set 
y_test - test labels

subject_train - subjects that are in a training set

X_train - training set
y_train - training labels

X_all - merged observations set
y_all - merged labels set

mean_std - vector with features names that contain mean or std measurements
 
varnames - variables names of mean and std measurements that require cleaning 

subject - a combined dataset of test and train sets
activity - a combines dataset of test and train activity sets 
all - merged dataframe of subject, activity and observations that contain measures of mean and std

orderedData - reorganized dataset to prepare it for counting mean by subject and activity
finalDataSet - final dataset grouped by mean of the observations for each subject and activity
