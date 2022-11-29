# Description statistics
#import iris data from library
data <- iris

head(data) #display the first n data
tail(data) #display the last n data

str(data) #describe the structure of data

###################################################################
# Determine the minimum and maximum value
min(data$Sepal.Length)
max(data$Sepal.Length)

# Determine the minimum and maximum value by range
range(data$Sepal.Length)

# Determine the range value [extract value using index]
range(data$Sepal.Length) [1]
range(data$Sepal.Length) [2] #

range_val <- range(data$Sepal.Length)
range_val[1]
range_val[2]

# Determine range value using min & max function
the_range <- max(data$Sepal.Length) - min(data$Sepal.Length)
print(the_range)

# Determine the mean & median value
mean(data$Sepal.Length)
median(data$Sepal.Length)

# Determine the mode value
mode = function(){
  return(sort(-table(data$Sepal.Length))[1])
}
mode() #OR

getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}
result <- getmode(data$Sepal.Length)
print(result)

# Determine the standard deviation & variance
sd(data$Sepal.Length)
var(data$Sepal.Length)

# Summarize the data using summary() function
summary(data) #summarize whole data
summary(data$Sepal.Length) #summarize specific data OR
by(data, data$Species, summary)

###################################################################
# Determine the first & third quartiles value
A <- c(170.2, 181.5, 188.9, 163.9, 166.4, 163.7, 160.4, 175.8, 181.5)

quantile(A) #display all the quartile
sort(A) #rearrange the arrangement in ascending order

quantile(A, 0.25) #determine the first quartile
quantile(A, 0.75) #determine the third quartile
quantile(A, 0.4) #determine other quartile
quantile(A, 0.8) #determine other quartile
IQR(A) #calculates the interquartile range

###################################################################
# Counting the number of rows
nrow(data)
nrow(data['Sepal.Length'])

# Counting the number of column
ncol(data)

# Counting the number of NA
sum(is.na(data$Sepal.Length))

# Counting the number of negative values
sum(data$Sepal.Length < 0)

# Counting the number of unique text-based values (non-numeric)
B <- c(rep("Yellow", 2), rep("Red", 3), rep("Yellow", 3), rep("Black", 3))
factor(B) #to categorize the data and store it as levels

###################################################################
# Visualization - Scatter Plot
data <- mtcars

x <- -10:10
y <- x * x
plot(x, y, xlab='x', ylab='y', col='red')

x <- data$wt
y <- data$mpg
plot(x, y, xlab='wt', ylab='mpg', col='green')

my <- read.csv("C:/Users/USER/OneDrive/Documents/Undergraduate/Year 2/SEM 2/Introduction to Data Science/Database/Week 5_covid_my.csv")

x <- 1:15
y<- my$Confirmed
plot(x, y, pch=16, col='blue', ylab='Confirmed case', main='Covid-19 Confirmed Cases in Malaysia')
text(x, y, labels=my$State, pos=4, cex=0.5)

###################################################################
# Histogram
hist(data$mpg, col='green')

###################################################################
# Bar chart
val = data$mpg
carnames = row.names(data)
# names.arg <- a vector of names appearing under each bar
barplot(val, ylab='mpg', main='Car - MPG', names.arg=carnames, cex.name=0.6, las=2, col='blue')

val = my$Deaths
name_st = my$State
barplot(val, ylab='Deaths', main="Covid-19 Deaths in Malaysia", names.arg=name_st, cex.names=0.6, las=2, col="orange")

###################################################################
# Pie chart
lbl = my$State
val2 = my$Confirmed

pie(val2, lbl, cex=0.5)

###################################################################
# 3D Pie chart
library(plotrix)

lbl = my$State
val2 = my$Confirmed
pie3D(val2,
      col = hcl.colors(length(val2), "Spectral"),
      border = "white",
      labels = lbl, labelcex = 0.5)

###################################################################
# Exploded 3D Pie chart 
library(plotrix)

val2 = my[my$Confirmed > 300000,]
val3 = val2$Confirmed
lbl = paste(val2$State, val2$Confirmed, sep = ",")
pie3D(val3,
      col = hcl.colors(length(val3), "Spectral"),
      border = "white",
      labels = lbl, labelcex = 0.5, explode = 0.2)
