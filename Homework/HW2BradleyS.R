###########################
# Name: Steven Bradley    #
# STAT 331: Homework 2.1  #
###########################



##### Part 1: Cryptography #####

#1a
char.vector <- c(as.character(c(0:9)), letters, "*")
char.vector

#1b
num.vector <- c(1:37)
num.vector

#1c
encryption.df <- data.frame(Numbers = num.vector, Characters = char.vector)
str(encryption.df)

#1d
hello.num.vec <- c(18,15,22,22,25)
encryption.df$Characters[hello.num.vec]

#1e
encoding.matrix <- cbind(c(-5,4,2,3),c(1,4,6,2), c(6,-5,2,1), c(-1,-4,5,9))
encoding.matrix

encoded.vector <- c(-45,-42,-63,-42,48,117,70,-47,-18,-17,88,-15,-5,-23,-43,-49,-58,-51,328,
  439,338,489,354,459,429,324,397,380,405,403,529,333,397,411,410,453)
encoded.matrix <- matrix(message.vector, nrow = 4, ncol = 9, byrow = TRUE)

#1f
decoding.matrix <- solve(encoding.matrix)

message.matrix <- decoding.matrix %*% encoded.matrix

#1g
message.matrix
is.integer(message.matrix)
# The is.integer method returns FALSE which shows us that the matrix is not populated by integers. Since the inverse matrix above contained floats, multiplying that matrix will give us floats.
decoding.matrix
decoding.matrix %*% encoding.matrix

round(decoding.matrix %*% encoding.matrix)

#1h
message.vector <- c(round(decoding.matrix %*% encoded.matrix))

char.vector[message.vector]


##### Part 2: Data Frames and Lists #####
#2a
set.seed(6128)

#2b
x <- rnorm(mean = 75, sd = 5, n = 50)
y <- runif(min = 0, max = 100, n = 50)
z <- sample(c("M","F"), prob = c(0.57, 0.43), replace = TRUE, size = 50)

#2c
my.df <- data.frame(exam1 = x, exam2 = y, gender = z)

#2d
my.df$exam1
my.df$exam1[17]
my.df[5,]

#2e
linearModel <- lm(exam1 ~ exam2, data = my.df)

#2f
linearModel
names(linearModel)

#2g
linearModel$residuals
linearModel$coefficients
linearModel[1]

#2h
list(my.df, linearModel$coefficients)


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
mexico <- grepl(pattern = "mexico", tolower(states)) |
grepl("B.C., MX", states) |
grepl("chihuahua", tolower(states))

gulf <- grepl("off", tolower(states)) |
grepl("gulf", tolower(states))

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
