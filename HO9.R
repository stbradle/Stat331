#########################
# Name: Steven Bradley  #
# Stat 331: Handout 9   #
#########################

###### Exercise 1 #######
#a
?dev.cur()

#b
dev.cur()
dev.list()

#c
set.seed(13823)
iq <- round(rnorm(536,mean = 100, sd = 10), digits = 0)

#d
hist(iq)    ##Good
barplot(iq) ##Not good

#e
dev.cur()
dev.list()

#f
dev.off(dev.list())

#g
pdf(file = "graphs.pdf",width = 7, height = 5)
hist(iq)
barplot(iq)
dev.off()

###### Exercise 2 ######

#a
hist(iq, breaks = 8, main = "Fig. 2a: Distribution of IQ's\n For a Random Sample of Americans(n=536)", ylab = "Count", xlab = "IQ", xlim = range(60:140))

#b
iq_hist <- hist(iq, breaks = 8, main = "Fig. 2a: Distribution of IQ's\n For a Random Sample of Americans(n=536)", ylab = "Count", xlab = "IQ", xlim = range(60:140))
iq_hist$counts <- iq_hist$counts/length(iq)
plot(iq_hist, main = "Fig. 2b: Relative Frequency Distribution of IQ's\n For a Random Sample of Americans(n=536)", ylab = "Propertion", xlab = "IQ", yaxs = "i")

#c
colors()
palette(c("springgreen3", "wheat2"))
plot(iq_hist,  col = c(1,2))

#d
shades_of_blue <- grep(pattern = "blue", colors(), value = TRUE)

#e
palette(c(colors()[7], "dodgerblue"))
plot(iq_hist, col = c(1,2))

#f
palette("orange")
plot(iq,xlab = "Case No.", ylab = "IQ", col = "orange", pch = 19, ylim = range(60: 140), main = "Fig. 2f: Distribution of IQ's\nFor a Random Sample of Americans(n=536)")
abline(h = 132, lty = 2, col = "cornflowerblue" )
text(x = 150, y = 134, "Mensa Required IQ = 132", col = "cornflowerblue")


###### Exercise 3 ######

#a
install.packages("dplyr")
library(ggplot2)
library(dplyr)
diamonds

boxplot(log(price) ~ cut, pch = 16, data = diamonds)
boxplot(log(carat) ~ cut, pch = 16, data = diamonds)


table(diamonds$cut)/nrow(diamonds)
set.seed(5719)
diamonds.sample <- diamonds[sample(c(1:nrow(diamonds)),size = 500),]


plot(log(diamonds.sample$price ~ diamonds.sample$carat))
