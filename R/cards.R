
shuffle<- function(cards){
  random<- sample(1:52, size = 52)
  cards[random,]
}

dealblack<- function(blackjack){
  random<-sample(1:52, size = 3)
  blackjack[random,]
}
dealheart<- function(hearts){
  random<-sample(1:52, size = 2)
  hearts[random,]
}


