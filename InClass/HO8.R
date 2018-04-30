####### Handout 8 ########


#### Exercise 1 ####
#a
rm(list = ls())

#b
search()
getwd()

#c
ls()
x <- rnorm(20,mean = 100, sd = 10)
ls()

#d
cpus
library(MASS)
search()
cpus

#e
detach(2)
search()

#f
?mtcars
names(mtcars)
str(mtcars)

#g
lm.out1 <- lm(mtcars$mpg ~ mtcars$wt)
lm.out2 <- lm(mpg ~ wt, data = mtcars)

attach(mtcars)
search()

#h
wt
detach(2)
wt

#i
ls()
attach(mtcars)
wt
wt[1] <- 2.260
ls()

##### Exercise 2 #####

#a
install.packages("dplyr")
library(dplyr)

#b
detach("mtcars")
install.packages("ggplot2")
library(ggplot2)
diamonds
class(diamonds)


#c
priceCarat_df <- select(.data = diamonds, carat, price)
beginWithC_df <- select(.data = diamonds, starts_with("c"))
containsPrice_df <- select(.data = diamonds, contains("price"))
noTable_df <- select(.data = diamonds, -(table))
noTableXYZ_df <- select(diamonds, -(table), -(x:z))
ideal_df <- filter(.data = diamonds, cut == "Ideal")
idealPriceCarat_df <- ideal_df %>% select(carat,price)
expIdealGood_d <- filter(diamonds, (cut == "Ideal" | cut == "Good") & price > 1000)


#d
ascending <- arrange(diamonds, carat)
descending <- arrange(diamonds, desc(carat))

piped <- arrange(diamonds, carat) %>% select(cut)
nopipe <- select(arrange(diamonds,carat),cut)


#e
diamonds = mutate(diamonds, price_to_carat = price/carat)
idealDiamonds_df <- filter(diamonds, cut == "Ideal") %>% mutate( price_to_carat_percent = price_to_carat/100)


#f
diamonds %>% group_by(cut) %>% summarize(mean = mean(carat), sd = sd(carat), n = n())


#g
diamonds %>% rename(height = x, width = y, depth = z)

colnames(diamonds)[colnames(diamonds) == "x"] <- "height"
colnames(diamonds)[colnames(diamonds) == "y"] <- "width"
colnames(diamonds)[colnames(diamonds) == "z"] <- "depth"
diamonds

