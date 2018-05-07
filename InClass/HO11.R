rm(list = ls())
library(ggplot2)
library(dplyr)


##### Exercise 1 #####
qplot(cut, geom = "bar", data = diamonds)

qplot(cut, geom = "bar", data = diamonds, 
      main = "Joint Frequency Distribution\nof Diamond Clarity by Cut", 
      xlab = "Cut", ylab = "Count") + geom_bar(aes(fill = clarity))

counts <- table(diamonds$clarity, diamonds$cut)
proportions <- prop.table(counts, 2)

barplot(height = proportions, xlim = c(0,10), ylim = c(0,1.1),
        xlab = "Cut", ylab = "Prop", cex.axis = 0.75, cex.names = 0.75,
        col = c("steelblue","lightgreen","lightcyan", "lavender","cornsilk","lightblue","orange","pink"),
        legend = rownames(proportions), args.legend = list(x="bottomright",title="Clarity"), cex = 0.75)
title(main = "Relative Frequency Distribution of\nDiamond Clarity by Cut(n=53,940)",adj = 0, cex = 0.65)


#### Exercise 2 ####
#a
set.seed(5719)
diamonds.sample <- diamonds[sample(c(1:nrow(diamonds)),size=500),]
ggplot(data =diamonds.sample) + geom_point(mapping=aes(x=carat,y=log(price), color = cut)) +
  geom_smooth(mapping = aes(x=carat, y=log(price), color = cut),method = "loess")

#b
ggplot(data =diamonds.sample) + geom_point(mapping=aes(x=carat,y=log(price), color = cut)) +
  geom_smooth(mapping = aes(x=carat, y=log(price)),method = "loess")

#c
ggplot(data =diamonds.sample) + geom_point(mapping=aes(x=carat,y=log(price), color = cut)) +
  geom_smooth(mapping = aes(x=carat, y=log(price), color = cut),method = "lm")
ggplot(data =diamonds.sample) + geom_point(mapping=aes(x=carat,y=log(price), color = cut)) +
  geom_smooth(mapping = aes(x=carat, y=log(price)),method = "lm")

#d
ggplot(data=filter(diamonds.sample, cut %in% c("Ideal", "Premium")), mapping = aes(x=carat,y=log(price), color = cut)) +
  geom_point() +
  geom_smooth(method = "lm",formula = y ~ x + I(x^2), se=F) +
  facet_grid(clarity ~ .)


#### Exercise 3 ####
summaryStats <- function(v){
  return(c(length(v), mean(v), sd(v), sd(v)/sqrt(length(v))))
}

sapply(split(diamonds$price, diamonds$clarity) ,summaryStats)

