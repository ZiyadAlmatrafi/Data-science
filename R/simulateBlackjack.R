library(gtools)
suits <- c("Diamonds", "Clubs", "Hearts", "Spades")
numbers <- c("Ace", "Deuce", "Three", "Four", "Five", "Six", "Seven", 
             "Eight", "Nine", "Ten", "Jack", "Queen", "King")
deck <- expand.grid(number=numbers, suit=suits)
deck <- paste(deck$number, deck$suit)
kings <- paste("King", suits)

aces <- paste("Ace", suits)
facecard <- c("King", "Queen", "Jack", "Ten")
facecard <- expand.grid(number = facecard, suit = suits)
facecard <- paste(facecard$number, facecard$suit)


hands <- combinations(52, 2, v = deck)
mean(hands[,1] %in% aces & hands[,2] %in% facecard)

mean((hands[,1] %in% aces & hands[,2] %in% facecard) |
       (hands[,2] %in% aces & hands[,1] %in% facecard))

(hands[1] %in% aces & hands[2] %in% facecard) | 
  (hands[2] %in% aces & hands[1] %in% facecard)


blackjack <- function(){
  hand <- sample(deck, 2)
  (hand[1] %in% aces & hand[2] %in% facecard) | 
    (hand[2] %in% aces & hand[1] %in% facecard)
}

n_time <- 10000
results <- replicate(n_time, blackjack())
wins<-length(results[results==TRUE])
losses<-length(results[results==FALSE])
sum(wins)
sum(losses)
melted<-melt(results)

#Graph
barplot(height=table(results), names.arg=c("Wins","Losses"), col="#69b3a2")        
