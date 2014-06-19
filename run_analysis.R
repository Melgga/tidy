## 1 Merge training and test, first merge each with subject & activity variables,
## melt to long format, then merge training and test

setwd("C:/Users/Altaxapur/Desktop/Getting Cleaning Data/WorkingDirectories/project")
setwd("./UCI HAR Dataset")
library(reshape2)
flnms<-c("ax","ay","az","gx","gy","gz","tx","ty","tz") #provisional names

##reading subject and activities
sub1<-read.table("./train/subject_train.txt",col.names="subject")
sub2<-read.table("./test/subject_test.txt",col.names="subject")
act1<-read.table("./train/y_train.txt",col.names="activity")
act2<-read.table("./test/y_test.txt",col.names="activity")
n1<-nrow(sub1)
sub1$id<-1:n1 ##id variables for merge
act1$id<-1:n1
n2<-nrow(sub2)
sub2$id<-1:n2
act2$id<-1:n2

d1<-dir("./train/Inertial Signals")
d2<-dir("./test/Inertial Signals")
cnames=paste("reading",1:128,sep="")

## merging and melting for the 9 measurements
for (i in 1:9){
  f1<-read.table(paste("./train/Inertial Signals/",d1[i],sep=""),col.names=cnames)
  f1$id<-1:n1
  f2<-read.table(paste("./test/Inertial Signals/",d2[i],sep=""),col.names=cnames)
  f2$id<-1:n2
  f1<-merge(f1,sub1,by="id")
  f1<-merge(f1,act1,by="id")
  f2<-merge(f2,sub2,by="id")
  f2<-merge(f2,act2,by="id")  
  x<-merge(f1,f2,all=TRUE)
  x$id<-paste("window",1:(n1+n2),sep="")
  y<-melt(x, id.vars = c("id", "subject","activity"))
  assign(flnms[i],y)
  #write.table(y, file=paste("dataset/",flnms[i],".txt",sep=""))
}
#2_4 mean, SD for each measurement in the data frame "dataset1"
mn<-rep(0,9);stdv<-rep(0,9)
##computing mean and SD for each measurement
for (i in 1:9){mn[i]<-mean(get(flnms[i])[,5]);stdv[i]<-sd(get(flnms[i])[,5])}
mn;stdv
#descriptive names for variables
vrnms<-c("accelerationx","accelerationy","accelerationz",
         "gyroscopex","gyroscopey","gyroscopez",
         "totalaccelerationx","totalaccelerationy","totalaccelerationz")
dataset1<-data.frame(measurement=vrnms,mean=mn,standardeviation=stdv)

#5 average by activity and subject in "dataset2"
actlabels<-read.table("activity_labels.txt",col.names=c("number","name"))
#3 descriptive names for activities
actlabels$name<-sub("_","",tolower(actlabels$name))

for (i in 1:9){
  df<-get(flnms[i])
  factorlist<-list(df$subject,df$activity)
  dft<-tapply(df$value,factorlist,mean) ##means for each pair of activity and subject
  dft2<-data.frame(dft)
  names(dft2)<-actlabels$name
  dft2$subject<-1:30
  dft2$measurement<-rep(vrnms[i],30)
  assign(paste("xx",i,sep=""),dft2)
}
xx<-rbind(xx1,xx2,xx3,xx4,xx5,xx6,xx7,xx8,xx9)
dataset2<-melt(xx, id.vars = c("subject","measurement"),variable.name = "activity", 
               value.name = "average")

write.csv(dataset1, file=paste("dataset/","dataset1",".txt",sep=""))
write.csv(dataset2, file=paste("dataset/","dataset2",".txt",sep=""))

## the end
##commands to see the datasets
str(dataset1)
dataset1

str(dataset2)
head(dataset2)
tail(dataset2)

xxx<-read.csv("dataset/dataset1.txt")





