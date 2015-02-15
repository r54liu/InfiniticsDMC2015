#function takes a column filled with E's and F's and gives a list of 1's and 0's.

language<-function(column){
  
  masterList<-c()
  i=1
  for(i in 1:length(column)){
    if(column[i]=='E'){
      masterList<-c(masterList, 1)
    } else {
      masterList<-c(masterList, 0)
    }
  }
  masterList
}

  

