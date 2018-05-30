########################
# Name: Steven Bradley #
# Stat 331: Handout 17 #
########################

rm(list = ls())
setwd("C:/Users/stbradle/Desktop/Stat331/Data/")
library(ggplot2)
library(dplyr)


# ICE 1
tips <- read.csv("tips.csv", stringsAsFactors = FALSE)
tips$tipPercent <- 100 * tips$tip / tips$billTotal
tips$day <- factor(tips$day, levels = c("Thur","Fri","Sat","Sun"))
tips <- rename(tips, case=X) %>% filter(tipPercent <= 40)
head(tips)

#b
boxplot(tips$tipPercent ~ tips$day, main = "Boxplot of Tip Percent by Day")
stripchart(tips$tipPercent ~ tips$day,add = TRUE, vertical = TRUE, main="Stripchart of TipPercent by Day")

#c

ggplot(data = tips, mapping = aes(x = tips$day, y = tips$tipPercent)) +
  geom_boxplot() + geom_jitter(width=0, pch = 0) + coord_cartesian(ylim = c(0:40))

#d
se <- function(vals){}

#e
group_by(tips, day) %>% summarize(mean = mean(tipPercent), median = median(tipPercent),
                                  sd = sd(tipPercent), min = min(tipPercent), max = max(tipPercent))

#f
anova.model <- aov(tipPercent ~ day, data = tips)
anova(anova.model)
names(anova.model)
plot(anova.model)

qqnorm(rstudent(anova.model))
qqline(rstudent(anova.model))
bartlett.test(tipPercent ~ day, data = tips)

TukeyHSD(anova.model, which="day")
plot(TukeyHSD(anova.model, which="day"))
