##################################
# Name: Steven Bradley		   #
# STAT 331: Handout 1		   #
##################################

x <- c(1,2,3,4,5,6,7,8,9,10)
y <- 45 + 3*x
plot(x,y)

y <- 45 + 3*x + rnorm(10,0,4)
plot(x,y)

ls()

x <- c(0,1,1,1,2,2)
x+2

y <- c(-1,-1,1,1,0,0)
x+y
x*y
x^y

z <- c(-1,-1,1,1)
x+z

z <- c(-1,1)
x+z

names <- c('ann','bill','chad','dwight')

is.numeric(x)
is.numeric(names)
is.character(x)
is.character(names)


