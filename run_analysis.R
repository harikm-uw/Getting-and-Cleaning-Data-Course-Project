run_analysis=function(){
  
  ##Point 1
  ##Reading all the necessary info into vectors
  
  activity_label=read.table("activity_labels.txt")
  features=read.table("features.txt")
  train=read.table("train/X_train.txt")
  activity_train=read.table("train/Y_train.txt")
  subject_train=read.table("train/subject_train.txt")
  test=read.table("test/X_test.txt")
  activity_test=read.table("test/Y_test.txt")
  subject_test=read.table("test/subject_test.txt")
  
  ##Combine the testing & training data into 1 set
  
  data_train=cbind(subject_train,activity_train,train)
  data_test=cbind(subject_test,activity_test,test)
  data=rbind(data_train,data_test)

  ##Assiging names to the data set
  
  names=as.character(features$V2)
  col_names=c("SubjectID","ActivityID",names)
  colnames(data)=col_names
  
  ##Point 2
  ##Subsetting using std() and mean()
  
  new=grep("Subject|Activity|mean|std",colnames(data))
  data_new=data[,new]
  
  ##Point 3
  ##Replacing the numbers in ActivityID with text from activity_label.txt
  
  x=as.numeric(as.character(activity_label[,1]))
  y=as.character(activity_label[,2])
  for(i in 1:6){
    data_new[,2]=replace(data_new[,2],data_new[,2]==x[i],y[i])
  }
  
  ##Point 4 
  ##Renaming variables
  colNames=colnames(data_new)
  for (i in 1:length(colNames)) 
  {
    colNames[i] = gsub("-std$","StdDev",colNames[i])
    colNames[i] = gsub("-mean","Mean",colNames[i])
    colNames[i] = gsub("^(t)","time",colNames[i])
    colNames[i] = gsub("^(f)","freq",colNames[i])
    colNames[i] = gsub("(BodyBody|Body)","Body",colNames[i])
    colNames[i] = gsub("Acc","Acceleration",colNames[i])
    colNames[i] = gsub("Mag","Magnitude",colNames[i])
  }
  
  colnames(data_new)=colNames
  
  ##Point 5
  ##Creating new data set which has the average values of each column 
  ##for each activity & each subject
  
  tidy_data=c()
  avg=numeric()
  a=unique(data_new[,1])
  b=as.character(activity_label[,2])
  for(i in a){
    for(j in b){
      new_set=subset(data_new,SubjectID==i & ActivityID==j)
      for(l in 3:length(data_new[1,])){
        avg=c(avg,mean(new_set[,l]))
      }
      tidy_data=rbind(tidy_data,c(i,j,avg))
    }
  }
  
  colnames(tidy_data)=colNames
  tidydata=data.frame(tidy_data)
  write.table(tidydata,"tidydata.txt",row.name=FALSE)
  
}