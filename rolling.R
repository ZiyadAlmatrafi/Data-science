prob<- c(1/10,1/10,1/10,1/10,1/10,1/10,1/10,1/10,1/10,1/10)
sum(prob)
prob2<-c(1/20,1/20,1/20,1/20,1/20,1/20,1/20,1/20,1/20,1/20,1/20,1/20,1/20,1/20,1/20,1/20,1/20,1/20,1/20,1/20)
sum(prob2)
die<- 1:10
die2<-1:20

roll<- function(die,prob){
  dice<- sample(die,6,replace=TRUE,prob)
  dice2<- sample(die2,6,replace = TRUE,prob2)
  sum(dice)
  sum(dice2)
  
}


rollCount<- function(dice){
  count=0
  count2=0
  for (i in dice){
    print(i)
    if(i>6){
      count =count+1
    }
    
    
  }
  for (j in dice2) {
    print(j)
    if(j>16){
      count2=count2+1
    }
    
  }
  sprintf("Number of dices more than 6 is: %i",count)
  sprintf("Number of dices more than 16 is: %i",count2)
}

