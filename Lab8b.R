# Activity 1
library(readxl)

titanic <- read.csv("C:/Users/USER/OneDrive/Documents/Undergraduate/Year 2/SEM 2/Introduction to Data Science/Database/Lab 7_titanic.csv")

dim(titanic)
titanic_cleaned = na.omit(titanic)
dim(titanic_cleaned)

library(dplyr)

titanic_filter1 = titanic_cleaned %>% filter(alive == 'yes', class == 'First')
titanic_filter2 = titanic_cleaned %>% filter(alive == 'yes', class == 'Second')
titanic_filter3 = titanic_cleaned %>% filter(alive == 'yes', class == 'Third')

x <- c(122, 83, 85)
labels <- c("First class", "Second class", "Third class")

#Pie chart
piepercent <- round(100*x / sum(x), 1)
pie(x, labels=piepercent, main="Total number of passenger alive in different class", col=rainbow(length(x)))
legend("topright", c("First class", "Second class", "Third class"), cex=1, fill=rainbow(length(x)))

#Bar chart
barplot(x, names.arg=labels, xlab="Class", ylab="Percentage of passenger alive", col="blue", main="Total number of passenger alive in different class", border="black")

# Activity 2
data(cars)
print(head(cars, 10))

input <- cars[, c('speed', 'dist')]

#Scatterplots
plot(x = input$speed,y = input$dist,
     xlab = "Distance",
     ylab = "Speed",
     main = "Speed vs Distance")

