### Biocomputing -- Exercise 08
### Ashton Bieri | github @ashtonbieri

### Problem 1: Generate summary plot for UW v MSU sample data
#set to directory with UWvMSU file
setwd("C:/Users/ashto/Desktop/Biocomputing/Biocomp-Exercise08")

library(ggplot2)
UWvMSU<-read.table("UWvMSU_1-22-13.txt",sep="",header=TRUE)

UWscores<-UWvMSU[which(UWvMSU$team=="UW"),]
UWscores$totalscore<-cumsum(UWscores$score)
plot(UWscores$time,UWscores$totalscore,type="l")

MSUscores<-UWvMSU[which(UWvMSU$team=="MSU"),]
MSUscores$totalscore<-cumsum(MSUscores$score)
lines(MSUscores$time,MSUscores$totalscore)

### Problem 2: "Guess my number" game
guessNumber <- function(){
  # create vector of numbers 1-100
  numbers<-1:100
  
  # pick random number from list
  answer<-sample(numbers,1)
  keepPlaying=TRUE
  print("I'm thinking of a number 1-100")
  
  ## loop: prompt for guess, respond lower, higher, or correct up to 10 guesses
  for (i in 1:10){
    if (keepPlaying==TRUE){
      guess<-readline(prompt="Guess: ")
      if (guess==answer){
        print("Correct!")
        keepPlaying=FALSE
      }else if (guess > answer){
        print("Lower")
      }else {
        print("Higher")
      }
    }
  }
}
guessNumber()

