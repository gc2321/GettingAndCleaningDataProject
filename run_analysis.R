analysis <- function() {
  
  # read tables 
  test<-read.table("./UCI_HAR_Dataset/test/X_test.txt")
  test1<-read.table("./UCI_HAR_Dataset/test/y_test.txt")
  
  train<-read.table("./UCI_HAR_Dataset/train/X_train.txt")
  train1<-read.table("./UCI_HAR_Dataset/train/y_train.txt")
  
  # add row names
  test2<-cbind(test1, test)
  train2<-cbind(train1, train)
  
  # combine train table and test table
  all<-rbind(test2, train2)
  
  # get column names and convert to character variable
  features<-read.table("./UCI_HAR_Dataset/features.txt")
  
  features[,2]<-as.character(features[,2])
  features<-rbind(data.frame(V1=0, V2="activities"), features)
  
  # mark all "mean()", "std()" in column name
  features[,2]<-gsub("mean[([])", "meanp", features[,2])
  features[,2]<-gsub("std[([])", "stdp", features[,2])
  
  # add column names to combined table
  colnames(all)<-features[,2]
  
  # make column name unique
  valid_column_names <- make.names(names=names(all), unique=TRUE, allow_ = TRUE)
  names(all) <- valid_column_names
  
  # dplyr
  
  library(dplyr) 
  
  a<- tbl_df(all) 
  a_ms <- select(a, activities, contains("meanp"), contains("stdp")) # dim(a_ms), [1] 10299    67
  
  # word changes to column names
  names(a_ms)<-gsub("meanp", "mean", names(a_ms))
  names(a_ms)<-gsub("stdp", "std", names(a_ms))
  
  names(a_ms)<-gsub(".mean.X", ".X.mean", names(a_ms))
  names(a_ms)<-gsub(".mean.Y", ".Y.mean", names(a_ms))
  names(a_ms)<-gsub(".mean.Z", ".Z.mean", names(a_ms))
  
  names(a_ms)<-gsub(".std.X", ".X.std", names(a_ms))
  names(a_ms)<-gsub(".std.Y", ".Y.std", names(a_ms))
  names(a_ms)<-gsub(".std.Z", ".Z.std", names(a_ms))
  
  # word changes to activities
  
  look<-a_ms[,1]
  look$activities<-as.character(as.numeric(look$activities))
  look<-as.data.frame(sapply(look,gsub,pattern="5",replacement="STANDING"))
  look<-as.data.frame(sapply(look,gsub,pattern="6",replacement="LAYING
                             "))
  look<-as.data.frame(sapply(look,gsub,pattern="4",replacement="SITTING
                             "))
  look<-as.data.frame(sapply(look,gsub,pattern="3",replacement="WALKING_DOWNSTAIRS
                             "))
  look<-as.data.frame(sapply(look,gsub,pattern="2",replacement="WALKING_UPSTAIRS"))
  look<-as.data.frame(sapply(look,gsub,pattern="1",replacement="WALKING"))
  
  a_ms2<-mutate(a_ms, activities = look[,1]) 
  
  # arrange "activities" alphabetically, arrange column name alphabetically
  a_ms2 <- arrange(a_ms2, activities) 
  a_ms2 <- a_ms2[,order(names(a_ms2))]
  
  # group each activities 
  a_ms3<-group_by(a_ms2, activities)
  
  # obtain mean of each variable in column name
  a_ms4<-summarise_each(a_ms3, funs(mean)) 
  
  # write table
  write.table(a_ms4, "tidy.txt", row.names = FALSE) 
}