#function takes a column filled with B's (1) and E's (0) and gives a vector of 1's and 0's.

matchType<-function(column){
  
  masterList<-c()
  i=1
  for(i in 1:length(column)){
    if(column[i]=='B'){
      masterList<-c(masterList, 1)
    } else {
      masterList<-c(masterList, 0)
    }
  }
  masterList
}

  

