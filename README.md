The run_analysis.R script is created to clean the data and create a dataset with groupped by observations mean per every subject and activity

1. load required packages
2. load files to R
3. merge training and testing datasets
4. leave only columns that have mean and std measures
5. modify mean_std names to get rid of not needed symbols
6. add subject ad activity to the dataset
7. make activity a factor that corresponds to the activity labels
8. create a new tidy dataset that shows average for each activity for each subject
