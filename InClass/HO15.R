########################
# Name: Steven Bradley #
# Stat 331: Handout 15 #
########################
rm(list = ls())
setwd("C:/Users/stbradle/Desktop/Stat331/Data/")
library(dplyr)
library(ggplot2)
##### 3 #####

#a
tips <- read.csv("tips.csv")

apply(select(tips, billTotal, tip),2, FUN = summary)

apply(select(tips,sex,day,time,size),2, table)

#b
tips$tipPercent = tips$tip/tips$billTotal * 100

ggplot(data = tips, mapping = aes(x = billTotal, y = tip, col = size)) + 
  geom_point()

ggplot(data = tips, mapping = aes(x = billTotal, y = tipPercent)) + 
  geom_point()

#c

tipPercent_tTest <- t.test(x = tips$tipPercent, mu = 15, alternative = "greater")

#d

#e
tipPercent_se <- sd(tips$tipPercent)/(sqrt(length(tips$tipPercent)))

#f

#g
result <- t.test(tips$tipPercent)
result$conf.int
