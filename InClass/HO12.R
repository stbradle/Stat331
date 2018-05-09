###########################
# Name: Steven Bradley    #
# Stat 331 : handout 12   #
###########################

setwd("C:/Users/stbradle/Desktop/Stat331/Data/")
library(ggplot2)
library(foreign)
library(dplyr)

#### Exercise 1 ####

#a
admit <- read.xport("admit.xpt")
stress2015 <- read.xport("stress2015.xpt")
stress2016 <- read.xport("stress2016.xpt")
admit <- setNames(admit, tolower(names(admit)))
stress2015 <- setNames(stress2015, tolower(names(stress2015)))
stress2016 <- setNames(stress2016, tolower(names(stress2016)))

#b
merged_stress <- merge(stress2015, stress2016, by = c("name","id"), all = TRUE, suffixes = c(".2015", ".2016"))

#c
lapply(list(stress2015), FUN = nrow)
lapply(list(stress2016), nrow)       
lapply(list(merged_stress),nrow)

#d

#e

#f
all.merged <- merge(merged_stress,admit, by = c("name","id"))

#g
hr_yr <- c()
for(ndx in 1:nrow(all.merged)){
  row <- all.merged[ndx,]
  if(is.na(row$resthr.2015)&& is.na(row$resthr.2016)){
    hr_yr <- c(hr_yr, "none")
  }
  else if( !is.na(row$resthr.2015) && is.na(row$resthr.2016)){
    hr_yr <- c(hr_yr, "2015")
  }
  else if(is.na(row$resthr.2015) && !is.na(row$resthr.2016)){
    hr_yr <- c(hr_yr, "2016")
  }
  else{
    hr_yr <- c(hr_yr, "both")
  }
}
all.merged["years"] = hr_yr
#### Exercise 2 ####
#a
write.csv(diamonds, "diamonds.csv",quote = FALSE)
#c
write.foreign(diamonds, "diamonds.xpt",tempfile(), package = "SAS")
#d
x <- c(1,2,3,4)
y <- c(5,6,7,8)
z <- c(x,y)
save(z, file = "xy.Rdata")
save(z,ascii = TRUE, file = "xy2.Rdata")
load("xy2.RData")

#### Exercise 3 ####
#a
list.files()
file.ndx <- grep("US Earthquakes", list.files())
eqDf <- data.frame()
for(ndx in file.ndx){
  filename <- list.files()[ndx]
  tDf <- read.csv(filename)
  eqDf <- rbind(eqDf, tDf)
}
