####################################
# Name: Steven Bradley             #
# STAT 331: Homework 1.2           #
####################################


##### R as a calculator #####

#1a
1+2+(3+4)

#1b
4**3 + 3**(2+1)

#1c
sqrt((4+3)*(2+1))

#1d
(1+2)/(3+4)**2

#1e - This is the value of a random variable Y, for a random normal variable(X) equal to 5 with a mean of 10 and a standard deviation of 2.
1/(sqrt(2*pi*4)) * exp(((-(5-10)**2)/(2*4)))


##### Simulated Experimental Data ######

#2a
male.heights <- rnorm(n = 25, mean = 72, sd = 2)

#2b
female.heights <- rnorm(n = 25, mean = 68, sd = 2)

#2c
heights <- c(male.heights,female.heights)

#2d 
male.weights <- rnorm(n = 25, mean = 160, sd = 15)
female.weights <- rnorm(n = 25, mean = 140, sd = 12)
weights <- c(male.weights, female.weights)

#2e
gender <- c(rep(x = 1, times = 25), rep(x = 0, times = 25))

#2f 
ID <- c(1:50)

#2g
table <- cbind(row.num,gender,heights,weights)

#2h
colMeans(table[,3:4])

#2i
short.table <- table[table[,3] < mean(heights),]

#2j
head(x = short.table, n = 10)
tail(x = short.table, n = 10)


#####Equating two functions of x #####
y1 <- function(x){
  return (1/5 * exp(-x/5))
}

y2 <- function(x){
  return (1/20 * log(x+2))
}

#3a
x <- seq(0,10, length.out = 1000)
plot(x = x, y = y1(x), type = "l")

#3b
plot(x, y2(x),type="l")

#3c
plot(x,y1(x),type = "l")
points(x,y2(x), type = "l")
# It appears that the two function y1 and y2 intersect at apprx. x = 4

#3d
narrow.x <- seq(3.9,4.1,length.out = 1000)
plot(narrow.x, y1(narrow.x), type="l")
points(narrow.x, y2(narrow.x), type="l")

#3e
min(abs(y1(narrow.x) - y2(narrow.x)))

#3f
abs.diff <- abs(y1(narrow.x) - y2(narrow.x))
idx <- match(min(abs.diff),abs.diff)
x.for.min.diff <- narrow.x[idx]
x.for.min.diff

#3g
y1(x.for.min.diff)
y2(x.for.min.diff)

#Estimate for optimal X value is approximately 4.0105. Values of functions: y1(4.0105) = 0.089677   y2(4.0105) = 0.089675.
