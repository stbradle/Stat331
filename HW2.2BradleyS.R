###########################
# Name: Steven Bradley    #
# STAT 331: Homework 2.2  #
###########################

#1a
setwd("~/Desktop/Stat 331/Data/")
getwd()

#1b
dataFrame.2010 <- read.csv("US Earthquakes 2010.csv")
head(dataFrame.2010)

#1c
place.vector <- as.vector(dataFrame.2010[["place"]])
states <- substring(text = place.vector, first = regexpr(",", place.vector) + 2)
states.table <- table(states)

#1d
mexico <- grepl(pattern = "mexico", tolower(states)) | grepl("B.C., MX", states) | grepl("chihuahua", tolower(states))
gulf <- grepl("off", tolower(states)) | grepl("gulf", tolower(states))
canada <- grepl("canada", tolower(states))

#1e
dataFrame.2010 <- data.frame(dataFrame.2010, state = states, stringsAsFactors = FALSE)
head(dataFrame.2010)

#1f
colnames(dataFrame.2010)
filter <- !(mexico | gulf | canada)
filtered.df <- dataFrame.2010[filter,]
filtered.df <- filtered.df[,c("place","state","mag","type")]
dim(filtered.df)
head(filtered.df)

#1g
unique(filtered.df[["state"]])
filtered.df[filtered.df$state == "CA","state"] = "California"
filtered.df[filtered.df$state == "NV","state"] = "Nevada"
filtered.df[grep("California", filtered.df$state), "state" ] = "California"
filtered.df[grep("Texas", filtered.df$state), "state" ] = "Texas"
filtered.df[grep("Idaho", filtered.df$state), "state" ] = "Idaho"
filtered.df[grep("Montana", filtered.df$state), "state" ] = "Montana"
length(unique(filtered.df$state))

#1h
relative.states <- table(filtered.df[["state"]])/length(filtered.df[["state"]])
barplot(relative.states)
#From the table relative.states and the barplot, we can see that the vast majority of earthquakes occurred in California.
