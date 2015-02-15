#function takes a column filled with G's (1) and Y's (0) and gives a vector of 1's and 0's.

SearchPlatform<-function(column){
  
  masterList<-c()
  i=1
  for(i in 1:length(column)){
    if(column[i]=='G'){
      masterList<-c(masterList, 1)
    } else {
      masterList<-c(masterList, 0)
    }
  }
  masterList
}

  

