#Exercise 8
#Reilley Knott, Intro to Biocomputing

#Part 1

#load in the data from the file
gameSummary <- read.table("~/Desktop/Biocomputing/ICB2019_Exercise08/UWvMSU_1-22-13.txt", sep = "\t", header=TRUE, stringsAsFactors=FALSE)

#isolate the scoring column for each school
UWScores <- gameSummary[gameSummary[,2] == "UW",]
MSUScores <- gameSummary[gameSummary[,2] == "MSU",]

#create the running total in a vector for each school
#UW
UWTotal<-rep(0,nrow(UWScores))
for(i in 1:nrow(UWScores)) {
  UWTotal[i] <- UWScores[i,3]
}

UWRunningTotal<-UWTotal
for(i in 2:length(UWTotal)){
  UWRunningTotal[i]<-UWTotal[i]+UWRunningTotal[(i-1)]
}

#MSU
MSUTotal<-rep(0,nrow(MSUScores))
for(i in 1:nrow(MSUScores)) {
  MSUTotal[i] <- MSUScores[i,3]
}

MSURunningTotal<-MSUTotal
for(i in 2:length(MSUTotal)){
  MSURunningTotal[i]<-MSUTotal[i]+MSURunningTotal[(i-1)]
}

#these running totals will be used for the Y axis on the graph
#the x-axis should be a function of time, so the times need to be isolated, similarly to above

UWTiming<-rep(0,nrow(UWScores))
for(i in 1:nrow(UWScores)) {
  UWTiming[i]<-UWScores[i,1]
}

MSUTiming<-rep(0,nrow(MSUScores))
for(i in 1:nrow(MSUScores)) {
  MSUTiming[i]<-MSUScores[i,1]
}

#Create the "plot" with the UW scores and add the MSU line using "lines"
plot(UWTiming,UWRunningTotal,type="l",xlab="Time",ylab="Score",col="red")
lines(MSUTiming,MSURunningTotal,type="l",col="dark green")

#Part2
#initialize the vector with numbers 1-100
numbers<-c({1:100})

#initialize the random number, between 1 and 100. It will be a different number every game play
RNumber<-sample(numbers,1)

#initialize the game
print("I'm thinking of a number between 1 and 100... You have 10 guesses")
#set that the user gets only 10 guesses
for (i in {1:11}) {
  #losing condition
  if (i == 11) {
    cat(sprintf("You lose! The number was %i.",RNumber))
    #game over
    break
  }
  #asking the user to input their guess
  guess<-readline(prompt="Your guess: ")
  #the guess is greater than the number
  if(guess > RNumber) {
    print("Lower")
    #the guess is lower than the number
  } else if (guess < RNumber) {
    print("Higher")
    #the user guesses the number correctly
  } else if (guess == RNumber) {
    cat(sprintf("Correct! The number was %i!",RNumber))
    #game ends
    break
  } 
}








