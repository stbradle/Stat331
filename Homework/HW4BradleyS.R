###########################
# Name: Steven Bradley    #
# Stat 331: Homework 4    #
###########################

#### Conditional Execution and Loop Exercise ####
eq_2018 <- read.csv("US Earthquakes 2018.csv")

#a
mags <- eq_2018$mag
hist(mags, breaks = 15, xlim = range(2:7), ylim = range(0:200), xlab = "Magnitude", main = "Distribution of Earthquake Magnitudes: US, 1/1/18-4/3/18")

#b
cat_vec <- rep(x = NA, times = length(mags))
i = 1
for(mag in mags){
  if (mag > 2.5 && mag < 3){
    cat_vec[i] = "2.5 -< 3"
  }
  else if (mag >= 3 && mag <= 4){
    cat_vec[i] = "3 -< 4"
  }
  else if(mag > 4){
    cat_vec[i] = "4+"
  }
  i = i + 1
}

barplot(sort(table(cat_vec), decreasing = TRUE), axis.lty = 1, space = .75, ylim = range(0:500), main = "Distribution of Earthquake Magnitudes: US, 1/1/18-4/3/18", xlab = "Magnitude")


#c
cut_mag <- cut(x = mags,breaks = c(2.5,3,4,10))
barplot(sort(table(cut_mag), decreasing = TRUE), axis.lty = 1, space = .75, ylim = range(0:500), main = "Distribution of Earthquake Magnitudes: US, 1/1/18-4/3/18", xlab = "Magnitude")



##### Birthday Problem #####

#a
sharedBirthdayProb <- function(k){
  return(1 - (choose(365,k)*factorial(k))/365**k)
}

#b
sizes <- matrix(c(2:100))
sizes <- cbind(sizes, matrix(apply(X = sizes, MARGIN = 1, FUN = sharedBirthdayProb)))

#c
msizes <- matrix(c(2:100))
msizes <- cbind(msizes, matrix(mapply(sharedBirthdayProb,msizes)))

#d
fsizes <- matrix(c(2:100, rep(NA, times = 99)), ncol = 2)
i = 1
for (size in fsizes[,1]){
  fsizes[i,2] <- sharedBirthdayProb(size)
  i = i + 1
}

#e
plot(x = sizes[,1], y = sizes[,2], type = "l", xlab = "Number of People", ylab = "Probability of a Pair", main = "Birthday Problem Probability Graph")
lines(x = c(0,23), y = c(0.5,0.5))
lines(x = c(23,23), y = c(0,0.5))
       