setwd("C:/Users/trey/Documents/GitHub/InfiniticsDMC2015")
data<-read.csv('SEM_DAILY_BUILD.CSV')

##given a 2 columns  (ad type and clicks) functino returns 2 column table
#(adtype and which bin it is in)


data1<-data[,11]
data2<-data[,24]

data1[4]=data1[3]
data2[4]=data2[3]

adType<-data1
clicks<-data2

ADBins<-function(adType, clicks, binDivider){
  
  masterTable<-cbind(adType, clicks)


  masterTable<-as.matrix(masterTable)
  
  #sorting the master table by adtype
  masterTable<-masterTable[order(masterTable[,1]),]
  

  #tallying the clicks for every adtype
  masterTable<-aggregate(masterTable[,2]~masterTable[,1], FUN=weighted.mean)  




  #sorting the master table by clicks
  masterTable<-masterTable[order(masterTable[,2]),]


  
  #creating a bin database
  a= length(masterTable[,1])
  i=a
  bucketSize= sum(masterTable[,2]) / binDivider
  counter=0
  bin=1
  binTable<-masterTable


  
  for (i in a:1){
    counter=masterTable[i,2]+counter
    
    binTable[i,2]=bin
    
   
    
    if (counter>bucketSize){
      print(counter)
      bin=bin+1
      counter=0
    }    
    
  }
  
  #sorting the bintable by bin number... low bin numbers will be 
  #searched alot so I want the on the top
  binTable<-binTable[order(binTable[,2]),]
  binTable

}

