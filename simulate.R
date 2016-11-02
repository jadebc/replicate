######################################
# Shiny R App to compare output from 
# two replicated analyses 
# simulate.R: script to generate example data

# Simulate hypothetical data with 2 outcomes measured 
# at 2 time points and analyzed in 2 ways
######################################
rm(list=ls())

# "Correct" data used by analyst 1
set.seed(123)
data1=data.frame(y=rbinom(1000,1,0.1))
data1$x=rbinom(1000,1,0.6)
data1$tr=c(rep("Treatment",500),rep("Control",500))
data1$w=rbinom(1000,1,0.5)

# "Incorrect" data used by analyst 1
# Data includes hypothetical miscoding of w
set.seed(123)
data2=data.frame(y=rbinom(1000,1,0.1))
data2$x=rbinom(1000,1,0.6)
data2$tr=c(rep("Treatment",500),rep("Control",500))
data2$w=rbinom(1000,1,0.5)
# miscoding: 
data2$w[1:100]=0

getprop=function(outcome,data){
  res=data.frame(aggregate(data[[outcome]],list(data$tr),mean)[,2])
  rownames(res)=c("Control","Treatment")
  colnames(res)="Proportion"
  return(res)
}

#--------------------------------------
# Object 1: Proportion of y in each treatment arm 
#--------------------------------------
prop.y_A=getprop("y",data1)
prop.y_B=getprop("y",data2)

prop.x_A=getprop("x",data1)
prop.x_B=getprop("x",data2)


#--------------------------------------
# Object 2: Relative risk of y - unadjusted
#--------------------------------------
rr.y_A=exp(summary(glm(y~tr,data=data1,family="binomial"(link=log)))$coef[2,1])
rr.y_B=exp(summary(glm(y~tr,data=data2,family="binomial"(link=log)))$coef[2,1])

rr.x_A=exp(summary(glm(x~tr,data=data1,family="binomial"(link=log)))$coef[2,1])
rr.x_B=exp(summary(glm(x~tr,data=data2,family="binomial"(link=log)))$coef[2,1])

#--------------------------------------
# Object 2: Relative risk of y - adjusted
#--------------------------------------
rr.y.adj_A=exp(summary(glm(y~tr+w,data=data1,family="binomial"(link=log)))$coef[2,1])
rr.y.adj_B=exp(summary(glm(y~tr+w,data=data2,family="binomial"(link=log)))$coef[2,1])

rr.x.adj_A=exp(summary(glm(x~tr+w,data=data1,family="binomial"(link=log)))$coef[2,1])
rr.x.adj_B=exp(summary(glm(x~tr+w,data=data2,family="binomial"(link=log)))$coef[2,1])


save(prop.y_A,rr.y_A,rr.y.adj_A,
     prop.x_A,rr.x_A,rr.x.adj_A,
     file="~/Documents/CRG/replicate-shiny-example/data/results_A.RData")

save(prop.y_B,rr.y_B,rr.y.adj_B,
     prop.x_B,rr.x_B,rr.x.adj_B,
     file="~/Documents/CRG/replicate-shiny-example/data/results_B.RData")


