##########################
# Name: Steven Bradley   #
# STAT 331: handout 5    #
##########################

##### Exercise 1 #####


#a
x <- 4
testFun1 <- function(x){
  x <- x**2
  x
}

testFun1()
testFun1(4)
testFun1(x=4)
testFun1(x=x)
x

#b
testFun2 <- function(x = 0){
  x
}
testFun2()
testFun2(NA)
testFun2(16)


##### Exercise 2 #####

#a
getInfo <- function(a,b){
  list(c(mean(a), mean(b)), c(median(a), median(b)), c(sd(a),sd(b)))
}

#b
a <- rnorm(n = 100,mean = 42, sd = 7)
b <- runif(n = 100, min = min(a), max = max(a))

getInfo(a,b)

a <- 5
b <- 10

getInfo(a,b)

a <- c(1,2,3,4,5)
b <- c(1,2,3,4,5)

getInfo(a,b)


##### Exercise 3 #####
#a
m <- cbind(c(1,2,3),c(4,5,6),c(7,8,9))

#b
apply(X = m, MARGIN = 1, FUN = sum)
apply(m, 2, sum)
apply(m, 1, mean)
apply(m , 2, mean)


##### Exercise 4 #####
getInfo <- function(...){
  data <- cbind(...)
  means <- apply(data, 2, mean)
  medians <- apply(data, 2, median)
  sds <- apply(data, 2, sd)
  list(means, medians, sds)
}

a <- rnorm(n = 100,mean = 42, sd = 7)
b <- runif(n = 100, min = min(a), max = max(a))
c <- rpois(n = 100,lambda = 42)

getInfo(a,b,c)


##### Exercise 5 #####

#a
e1 <- rep(c(TRUE,FALSE), each = 20)
e2 <- c(rep(TRUE, each = 10), rep(FALSE, each = 30))

e1 | e2
e1 || e2

e1 & e2
e1 && e2


##### Exercise 6 #####

#a
measureValue <- function(n){
  if ((max(n) > 1.5*IQR(n) + quantile(n, 3/4)) || (min(n) < (quantile(n, 1/4) - 1.5*IQR(n)))){
    measure <- "Median"
    value <- median(n)
  } 
  else {
    measure <- "Mean"
    value <- mean(n)
  }
  return(list(Measure = measure, Value = value))
}

#b
b <- rnorm(n = 50, mean = 42, sd = 6)
measureValue(b)

#c
c <- rcauchy(n = 50) 
measureValue(c)

#d
# For part(b), we use the mean method. For part(c), we use the median method.

#e 
numNorm <- 0
numCauchy <- 0
for(i in 1:10){
  b <- rnorm(n = 50, mean = 42, sd = 6)
  c <- rcauchy(n = 50)
  
  normRes <- measureValue(b)
  cauchyRes <- measureValue(c)
  
  if (normRes[1] == "Mean"){
    numNorm = numNorm + 1
  }
  if (cauchyRes[1] == "Mean"){
    numCauchy = numCauchy + 1
  }
  
}

##### Exercise 7 #####
findOutliers <- function(n){
  data <- c(n)
  z.scores <- scale(n, center = TRUE, scale = TRUE)
  is.outlier <- z.scores > 1.654 | z.scores < -1.654
  
  return(data.frame(data = data, z.scores = z.scores, is.outlier = is.outlier))
}

a <- rnorm(n = 100, mean = 42, sd = 6)
b <- rcauchy(n = 100)

findOutliers(a)
findOutliers(b)
