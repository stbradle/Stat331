####################################
# Name: Steven Bradley		         #
# STAT 331: In-Class Exercise #2   #
####################################

p <- seq.int(0,1000)
p <- p/1000
logit_p <- log(p/(1-p))
plot(p,logit_p)

x <- seq(-10,10,length.out=1000)
logistic_x <- exp(x)/(1+exp(x))
plot(x,logistic_x)
