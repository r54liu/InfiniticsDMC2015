### keyword list

library(cvTools)

setwd("c:/users/trey/dropbox/Capital One Data Mining Competition/Data")
data<-read.csv('SEM_DAILY_BUILD.CSV')


data1<-data[,6]


listKW <- function(unsplitString){ 
  x<-strsplit(unsplitString, " ")
  KW<-x[c(3:length(x))]
  KW
}


colKW <- function(unsplitCol){ 
  unsplitCol<-as.matrix(unsplitCol)
  masterList<-list()
  
  i=1
  for(i in 1:length(unsplitCol)){
    masterList<-append(masterList,list(listKW(unsplitCol[[i]])) )
  }
  masterList
}


buildKWDict<- function(unsplitCol){ 
  
  unsplitCol<-as.matrix(unsplitCol)
  masterList<-c()
  
  i=1
  for(i in 1:length(unsplitCol)){
    
    
    masterList<-append(masterList, listKW(unsplitCol[[i]]) )
  }
  unique(masterList)
}



