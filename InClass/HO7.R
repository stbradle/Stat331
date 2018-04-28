##### Exercise 1 #####
#a
m1 <- matrix(data = c(rnorm(n = 20,mean = 0,sd = 1), rnorm(n = 20,mean = 100,sd = 10),rnorm(n = 20,mean = 1000,sd = 100)), nrow = 20, ncol = 3)

#b
row_means <- apply(m1, MARGIN = 1, FUN = mean)
col_means <- apply(m1, 2, mean)

#c
get_info <- function(v){
  sample_size <- length(v)
  sample_mean <- mean(v)
  sample_sd <- sd(v)
  
  return(list(size = sample_size, mean = sample_mean, sd = sample_sd))
}

#d
col_info <- apply(m1, 2, get_info)



##### Exercise 2 #####
#a
age <- runif(n = 20,min = 18, max = 65)
height <- round(rnorm(n = 20,mean = 65,sd = 4), digits = 1)
IQ <- round(rnorm(n =20, mean = 100, sd = 10), digits = 0)
L1 <- list(Age = age, Ht = height, IQ = IQ)

#b
L1_mean <- lapply(L1,mean)
#c
L1_info <- lapply(L1, get_info)
L1_info$IQ$mean
#d
pet <- sample(c("Dog","cat"), size = 5, replace = TRUE)
L1[["pet"]] <- pet
lapply(L1[c("Age","Ht","IQ")], get_info)
sapply(L1[c("Age","Ht","IQ")], get_info)


##### Exercise 3 #####
#a
setwd("C:/Users/stbradle/Desktop")
eq_2018 <- read.csv("US Earthquakes 2018.csv")

subset <- eq_2018[grepl("Oklahoma",x = eq_2018$place) | grepl("CA", eq_2018$place),]
CA_eq <- subset[grepl("CA",x= subset$place),]
OK_eq <- subset[grepl("Oklahoma",x = subset$place),]
subset$state <- substring(text = subset$place, first = regexpr(",", subset$place) + 2)
s1 <- split(subset,subset$state)

ca_info <- lapply(s1$CA$mag,get_info)
ok_info <- lapply(s1$Oklahoma$mag, get_info)


#### Exercise 4 ####
hist(eq_2018$mag,breaks = 20,xlab = "Magnitude", xlim = range(2,7), ylim = range(0,200), main = "Distribution of Earthquake Magnitudes: US, 1/1/18-4/3/18")

cat_vec <- c()
dummy_vec <- c()
for (mag in eq_2018$mag){
  if (mag <= 3 && mag > 2.5){
    cat_vec <- c(cat_vec, "Low")
    dummy_vec <- c(dummy_vec, 0)
  }
  else if (mag > 3 && mag <= 4){
    cat_vec <- c(cat_vec, "Medium")
    dummy_vec <- c(dummy_vec, 1)
  }
  else if( mag > 4){
    cat_vec <- c(cat_vec, "High")
    dummy_vec <- c(dummy_vec, 2)
  }
}
barplot(table(dummy_vec), names.arg = c("2.5 -< 3", "3 -< 4", "4+"),ylim = range(0,500), ylab = "Frequency", xlab = "Magnitude", main = "Distribution of Earthquake Magnitudes: US, 1/1/18-4/3/18")
plot(cut(eq_2018$mag, breaks = c(2.5,3,4,10)), names.arg = c("2.5 -< 3", "3 -< 4", "4+"),ylim = range(0,500), ylab = "Frequency", xlab = "Magnitude", main = "Distribution of Earthquake Magnitudes: US, 1/1/18-4/3/18")
