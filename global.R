######################################
# Shiny R App to compare output from 
# two replicated analyses 
# global.R: script to process data for shiny app 
######################################
rm(list=ls())

setwd("~/Documents/CRG/replicate-shiny-example")

# list all objects in directory 
objects <- list.files(path=paste(getwd(),"/Data",sep=""))

# load all objects in directory
for(i in 1:length(objects)) {
  load(paste(getwd(),"/Data/",objects[i],sep=""))
}

# list of object names with no suffix
root.list=matrix(c("prop.y","rr.y","rr.y.adj",
                   "prop.x","rr.x","rr.x.adj"))

# Making a function to take difference of objects and compare
mydiff=function(object,suffix1,suffix2){
  obj1=get(paste(object,"_",suffix1,sep=""))
  obj2=get(paste(object,"_",suffix2,sep=""))
   
  diff=obj1-obj2
  
  # create variables that use the object name to determine
  # features about each object 
  measure=NA
  measure[length(grep("prop",object,ignore.case=TRUE))>0]="Proportion"
  measure[length(grep("rr",object,ignore.case=TRUE))>0]="RR"
  
  outcome=NA
  outcome[length(grep("y",object,ignore.case=TRUE))>0]="Y"
  outcome[length(grep("x",object,ignore.case=TRUE))>0]="X"
  
  adjusted="No"
  adjusted[length(grep("adj",object,ignore.case=TRUE))>0]="Yes"

  # create replication status variable
  status=ifelse(max(diff)<0.001,"Replicated","Not replicated")
  
  # create output vector
  out=c(object,outcome,measure,adjusted,round(abs(max(diff)),digits=3),status)
  
  return(out)
}

# create data frame to input into Shiny app
display=as.data.frame(t(apply(root.list,1,function(x) 
  mydiff(x,suffix1="A",suffix2="B"))))

colnames(display)=c("Object","Outcome","Measure","Adjusted","Max. difference","Status")



