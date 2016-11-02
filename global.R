# process data for shiny app 
rm(list=ls())

setwd("~/Dropbox/WBK-primary-analysis/programs/compare")
# load everything in each directory
dir=getwd()
dir=substr(dir, 1, nchar(dir)-17)
jade.res <- list.files(path=paste(dir,"/Results/jade/",sep=""))
for(i in 1:length(jade.res)) {
  load(paste(dir,"/Results/jade/",jade.res[i],sep=""))
}
and.res <- list.files(path=paste(dir,"/Results/andrew/",sep=""))
for(i in 1:length(and.res)) {
  load(paste(dir,"/Results/andrew/",and.res[i],sep=""))
}

# list of object names with no suffix

root.list=matrix(c(
  "diar_t0_n","diar_t1_n","diar_t2_n", "diar_t0_prev","diar_t1_prev","diar_t2_prev",
  "diar_h1_pr_unadj","diar_h1_rd_unadj","diar_h2_pr_unadj","diar_h2_rd_unadj",
  "diar_h1_pval_unadj","diar_h2_pval_unadj",
  "diar_h1_pr_adj","diar_h1_rd_adj","diar_h2_pr_adj","diar_h2_rd_adj",
  "diar_h1_pval_adj","diar_h2_pval_adj",

  "laz_t1_n","laz_t2_n","laz_t1_h1_rd_unadj","laz_t1_h3_rd_unadj",
  "laz_t2_h1_rd_unadj","laz_t2_h3_rd_unadj",
  "laz_t1_h1_pval_unadj","laz_t2_h1_pval_unadj","laz_t2_h1_pval_unadj","laz_t2_h3_pval_unadj",
  "laz_t1_h1_rd_adj","laz_t1_h3_rd_adj",
  "laz_t2_h1_rd_adj","laz_t2_h3_rd_adj",
  "laz_t1_h1_pval_adj","laz_t1_h3_pval_adj",
  "laz_t2_h1_pval_adj","laz_t2_h3_pval_adj",

  "waz_t1_n","waz_t2_n",
  "waz_t1_h1_rd_unadj", "waz_t1_h3_rd_unadj",
         "waz_t2_h1_rd_unadj", "waz_t2_h3_rd_unadj",
  "waz_t1_h1_pval_unadj", "waz_t1_h3_pval_unadj",
     "waz_t2_h1_pval_unadj", "waz_t2_h3_pval_unadj",

  "whz_t1_n","whz_t2_n",
  "whz_t1_h1_rd_unadj", "whz_t1_h3_rd_unadj",
     "whz_t2_h1_rd_unadj", "whz_t2_h3_rd_unadj",
  "whz_t1_h1_pval_unadj", "whz_t1_h3_pval_unadj",
     "whz_t2_h1_pval_unadj", "whz_t2_h3_pval_unadj",

  "hcz_t1_n","hcz_t2_n",
  "hcz_t1_h1_rd_unadj", "hcz_t1_h3_rd_unadj",
     "hcz_t2_h1_rd_unadj", "hcz_t2_h3_rd_unadj",
  "hcz_t1_h1_pval_unadj", "hcz_t1_h3_pval_unadj",
    "hcz_t2_h1_pval_unadj", "hcz_t2_h3_pval_unadj",

  "stunt_t1_n", "stunt_t2_n",
  "stunt_t1_prev", "stunt_t2_prev",
  "stunt_t1_h1_pr_unadj", "stunt_t1_h3_pr_unadj",
     "stunt_t1_h1_rd_unadj", "stunt_t1_h3_rd_unadj",
     "stunt_t2_h1_pr_unadj", "stunt_t2_h3_pr_unadj",
     "stunt_t2_h1_rd_unadj", "stunt_t2_h3_rd_unadj",
  "stunt_t1_h1_pval_unadj","stunt_t1_h3_pval_unadj",
               "stunt_t2_h1_pval_unadj","stunt_t2_h3_pval_unadj",

  "sstunt_t1_n", "sstunt_t2_n",
  "sstunt_t1_prev", "sstunt_t2_prev",
  "sstunt_t1_h1_pr_unadj", "sstunt_t1_h3_pr_unadj",
     "sstunt_t1_h1_rd_unadj", "sstunt_t1_h3_rd_unadj",
     "sstunt_t2_h1_pr_unadj", "sstunt_t2_h3_pr_unadj",
     "sstunt_t2_h1_rd_unadj", "sstunt_t2_h3_rd_unadj",
  "sstunt_t1_h1_pval_unadj","sstunt_t1_h3_pval_unadj",
        "sstunt_t2_h1_pval_unadj","sstunt_t2_h3_pval_unadj",

  "wast_t1_n", "wast_t2_n",
  "wast_t1_prev", "wast_t2_prev",
  "wast_t1_h1_rd_unadj", "wast_t1_h3_rd_unadj",
         "wast_t1_h1_pr_unadj", "wast_t1_h3_pr_unadj",
  "wast_t2_h1_rd_unadj", "wast_t2_h3_rd_unadj",
     "wast_t2_h1_rd_unadj", "wast_t2_h3_rd_unadj",
  "wast_t1_h1_pval_unadj","wast_t1_h3_pval_unadj",
        "wast_t2_h1_pval_unadj","wast_t2_h3_pval_unadj",

  "underwt_t1_n", "underwt_t2_n",
  "underwt_t1_prev", "underwt_t2_prev",
  "underwt_t1_h1_rd_unadj", "underwt_t1_h3_rd_unadj",
         "underwt_t2_h1_rd_unadj", "underwt_t2_h3_rd_unadj",
         "underwt_t1_h1_pr_unadj", "underwt_t1_h3_pr_unadj",
         "underwt_t2_h1_rd_unadj", "underwt_t2_h3_rd_unadj",
  "underwt_t1_h1_pval_unadj","underwt_t1_h3_pval_unadj",
        "underwt_t2_h1_pval_unadj","underwt_t2_h3_pval_unadj",

    "waz_t1_h1_rd_adj", "waz_t1_h3_rd_adj",
      "waz_t2_h1_rd_adj", "waz_t2_h3_rd_adj",
"waz_t1_h1_pval_adj", "waz_t1_h3_pval_adj",
  "waz_t2_h1_pval_adj", "waz_t2_h3_pval_adj",

 "whz_t1_h1_rd_adj", "whz_t1_h3_rd_adj",
    "whz_t2_h1_rd_adj", "whz_t2_h3_rd_adj",
"whz_t1_h1_pval_adj", "whz_t1_h3_pval_adj",
  "whz_t2_h1_pval_adj", "whz_t2_h3_pval_adj",

"hcz_t1_h1_rd_adj", "hcz_t1_h3_rd_adj",
   "hcz_t2_h1_rd_adj", "hcz_t2_h3_rd_adj",
"hcz_t1_h1_pval_adj", "hcz_t1_h3_pval_adj",
 "hcz_t2_h1_pval_adj", "hcz_t2_h3_pval_adj",

 "stunt_t1_h1_pr_adj", "stunt_t1_h3_pr_adj",
   "stunt_t2_h1_pr_adj", "stunt_t2_h3_pr_adj",
 "stunt_t1_h1_rd_adj", "stunt_t1_h3_rd_adj",
       "stunt_t2_h1_rd_adj", "stunt_t2_h3_rd_adj",
"stunt_t1_h1_pval_adj","stunt_t1_h3_pval_adj",
     "stunt_t2_h1_pval_adj","stunt_t2_h3_pval_adj",

"sstunt_t1_h1_pr_adj", "sstunt_t1_h3_pr_adj",
  "sstunt_t1_h1_rd_adj", "sstunt_t1_h3_rd_adj",
  "sstunt_t2_h1_pr_adj", "sstunt_t2_h3_pr_adj",
  "sstunt_t2_h1_rd_adj", "sstunt_t2_h3_rd_adj",
"sstunt_t1_h1_pval_adj","sstunt_t1_h3_pval_adj",
     "sstunt_t2_h1_pval_adj","sstunt_t2_h3_pval_adj",

"wast_t1_h1_rd_adj", "wast_t1_h3_rd_adj",
  "wast_t1_h1_pr_adj", "wast_t1_h3_pr_adj",
"wast_t2_h1_rd_adj", "wast_t2_h3_rd_adj",
  "wast_t2_h1_pr_adj", "wast_t2_h3_pr_adj",
 "wast_t1_h1_pval_adj","wast_t1_h3_pval_adj",
      "wast_t2_h1_pval_adj","wast_t2_h3_pval_adj",

"underwt_t1_h1_rd_adj", "underwt_t1_h3_rd_adj",
      "underwt_t2_h1_rd_adj", "underwt_t2_h3_rd_adj",
      "underwt_t1_h1_pr_adj", "underwt_t1_h3_pr_adj",
      "underwt_t2_h1_rd_adj", "underwt_t2_h3_rd_adj",
"underwt_t1_h1_pval_adj","underwt_t1_h3_pval_adj",
     "underwt_t2_h1_pval_adj","underwt_t2_h3_pval_adj",

  "perm.haz.dist","perm.diarr.dist","perm.haz.dist.adj",
"perm.diarr.dist.adj"

  
))

# Making a function to take difference of objects and compare
mydiff=function(object,suffix1,suffix2){
  obj1=get(paste(object,"_",suffix1,sep=""))
  obj2=get(paste(object,"_",suffix2,sep=""))
  
  dim1=matrix(dim(obj1))
  dim2=matrix(dim(obj2))
  
  msg= paste(object,"Object dimensions don't match")
  
  if(max(abs(dim1-dim2))>0) stop(msg)
   
  diff=obj1-obj2
  
  # create variables for different types of objects
  adj=ifelse(length(grep("_adj",object))>0,"Yes","No")
  
  time=NA
  time[length(grep("_t0",object))>0]="0"
  time[length(grep("_t1",object))>0]="1"
  time[length(grep("_t2",object))>0]="2"
  time[length(grep("_t12",object))>0]="1 and 2"
  
  hypothesis=NA
  hypothesis[length(grep("_h1",object))>0]="1"
  hypothesis[length(grep("_h2",object))>0]="2"
  hypothesis[length(grep("_h3",object))>0]="3"
  
  measure=NA
  measure[length(grep("_rd_",object,ignore.case=TRUE))>0]="RD"
  measure[length(grep("_rr_",object,ignore.case=TRUE))>0]="RR"
  measure[length(grep("_pr_",object,ignore.case=TRUE))>0]="PR"
  measure[length(grep("_pval_",object,ignore.case=TRUE))>0]="P-value"
  measure[length(grep("perm",object,ignore.case=TRUE))>0]="P-value"
  measure[length(grep("_n",object,ignore.case=TRUE))>0]="N"
  measure[length(grep("_prev",object,ignore.case=TRUE))>0]="Prevalence"
  
  outcome=NA
  outcome[length(grep("diar",object,ignore.case=TRUE))>0]="Diarrhea"
  outcome[length(grep("laz",object,ignore.case=TRUE))>0]="LAZ"
  outcome[length(grep("haz",object,ignore.case=TRUE))>0]="HAZ"
  outcome[length(grep("waz",object,ignore.case=TRUE))>0]="WAZ"
  outcome[length(grep("whz",object,ignore.case=TRUE))>0]="WHZ"
  outcome[length(grep("hcz",object,ignore.case=TRUE))>0]="HCZ"
  outcome[length(grep("stunt",object,ignore.case=TRUE))>0]="Stunting"
  outcome[length(grep("sstunt",object,ignore.case=TRUE))>0]="Severe stunting"
  outcome[length(grep("wast",object,ignore.case=TRUE))>0]="Wasting"
  outcome[length(grep("underwt",object,ignore.case=TRUE))>0]="Underwt"
  
  # create replication status variable
  status=ifelse(max(diff)<0.001,"Replicated","Not replicated")
  
  # create output vector
  out=c(object,outcome,time,hypothesis,measure,adj,round(abs(max(diff)),digits=3),status)
  
  return(out)
}

display=as.data.frame(t(apply(root.list,1,function(x) 
  mydiff(x,suffix1="j",suffix2="A"))))

colnames(display)=c("Object","Outcome","Time","Hypothesis","Measure","Adjusted","Max. difference","Status")



