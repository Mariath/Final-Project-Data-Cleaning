  
run_analysis<-function(){  
  #load required packages
  
  
  
  if (!require(data.table)) {
    install.packages("data.table")
  }
  
  if (!require(reshape2)) {
    install.packages("reshape2")
  }
  
  library(data.table)
  library(reshape2)
  
  #load files to R
  directory<-'C:/Users/mariat/Downloads/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset'
  
  activity_labels<-read.table(paste(directory,"/activity_labels.txt",sep=''))
  features<-read.table(paste(directory,"/features.txt",sep=''),stringsAsFactors = FALSE)
  
  subject_test<-read.table(paste(directory,'/test/subject_test.txt',sep=''))
  X_test<-read.table(paste(directory,'/test/X_test.txt',sep=''))
  y_test<-read.table(paste(directory,'/test/y_test.txt',sep=''))
  
  subject_train<-read.table(paste(directory,'/train/subject_train.txt', sep=''))
  X_train<-read.table(paste(directory,'/train/X_train.txt',sep=''))
  y_train<-read.table(paste(directory,'/train/y_train.txt',sep=''))
  
  #merge training and testing datasets
  X_all<-rbind(X_test,X_train)
  y_all<-rbind(y_test,y_train)
  

  
  
  #leave only columns that have mean and std measures
  colnames(X_all)<-features[,2]
  mean_std<-grep('mean()|std()',features[,2],value=TRUE)
  
  #modify mean_std names to get rid of not needed symbols
  
  X_all<-X_all[,mean_std]
  varnames<-as.list(colnames(X_all))

  varnames=sub('\\(','',varnames)
  varnames=sub('\\)','',varnames)
  varnames=tolower(varnames)
  varnames=sub('bodybody','body',varnames)
  colnames(X_all)<-varnames
  

  #add subject and activity to the dataset
  subject<-rbind(subject_test,subject_train)
  names(subject)<-'subject'
  activity<-rbind(y_test,y_train)
  names(activity)<-'activity'
  all<-cbind(subject,activity,X_all)
  
  #make activity a factor that corresponds to the activity labels
  act_factor<-factor(all$activity)
  levels(act_factor)<-activity_labels[,2]
  all$activity<-act_factor
  
  #create a new tidy dataset that shows average for each activity for each subject
  orderedData<-melt(all,id.vars=c('subject','activity'))
  finalDataSet <- dcast(orderedData, subject + activity ~ variable, mean)
  names(finalDataSet)[-c(1:2)] <- paste("[mean of]" , names(finalDataSet)[-c(1:2)] )
  write.csv(finalDataSet, 'finalDataset.csv',row.names=FALSE)
  write.table(finalDataSet,'tidy.txt',row.names=FALSE)
}


