########################
# Name: Steven Bradley #
# Stat 331: Handout 13 #
########################
library(ggplot2)
#1
files = list.files()[grep("us earthquakes", tolower(list.files()))]
df <- data.frame()
for(file in files){
  df <- rbind(df,read.csv(file))
}

###### 2 ######

#a
bDay <- sample(x=1:366,size=10,replace=TRUE)
length(unique(bDay)) == 10

#b
bDay.matches = 0
find.bday.matches <- function(n, size=10){
  matches = 0
  prob = c()
  for(ndx in 1:n){
    bDay <- sample(x=1:365,size=size,replace=TRUE)
    if(length(unique(bDay))!= size){
      matches = matches + 1
    }
    prob <- c(prob, matches/n)
  }
  return(list(matches, prob))
}
find.bday.matches(100)

find.bday.matches(1000)

find.bday.matches(10000)
#c
graph.probs <- function(n, size=10){
  probs <- find.bday.matches(n,size)[2]
  df <- data.frame(c(1:n), probs[1])
  colnames(df) <- c("Iter", "Prob")
  return(ggplot(data = df, mapping = aes(x = Iter, y = Prob)) +
          geom_smooth(se=FALSE) +
          labs(title = "Relationship between number of iterations\nand Probability of a Birthday Match",
               x = "Number of Iterations", y = "Probabilities"))
    #plot(x = c(1:n), y = probs[[1]],type = 's',
     #         xlab = "Number of Iterations" , ylab = "Probability",
    #          main = "Relationship between number of iterations\n and Probability of a Birthday Match" ))
}
graph.probs(1000)


#d
actual.prob <- 1-choose(365,150)*factorial(150)/(365^150)

#e
graph.probs(1000, 150)

#f
prob <- c()
for(i in 2:300){
  nIters = 600+i
  prob <- c(prob, find.bday.matches(n=nIters, size = i)[[1]]/nIters)
}


##### 3 #####

divisble.range.by.x <- function(lo, hi, x){
  i = lo
  while(i < hi){
    if(!(i %% x)){
      print(i)
    }
    i = i+1
  }
}

##### 4 #####
estimate.k <- function(rad, points = 1000, repeats = FALSE){

  diff = 1
  x <- runif(points, -rad, rad)
  y <- runif(points, -rad, rad)
  plot(x,y, pch = 16)
  dist <- sqrt(x**2 + y**2) <= rad
  prop <- sum(dist)/points
  prev <- 4*prop
  if(repeats){
    while(diff > 0.00001){
      x <- runif(points, -rad, rad)
      y <- runif(points, -rad, rad)
      dist <- sqrt(x**2 + y**2) <= rad
      prop <- sum(dist)/points
      points(x,y, pch = 16)
      diff = 4*prop - prev
    }
  }
  xx <- rad*cos( seq(0,2*pi, length.out=360) )
  yy <- rad*sin( seq(0,2*pi, length.out=360) )
  points(xx,yy, col='red', pch = 12, cex = 0.45)
  return(4*prop)
}

estimate.k(4, points = 10000, repeats = TRUE)

