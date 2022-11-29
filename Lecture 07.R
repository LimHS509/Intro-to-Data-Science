# Simple linear regression
#data of height
x <- c(151, 174, 138, 186, 128, 136, 179, 163, 152, 131)
#data of weight
y <- c(63, 81, 56, 91, 47, 57, 76, 72, 62, 48)

# Apply the lm() function
relation <- lm(y ~ x) #used to fit linear models
print(relation)

# Find weight of a person with height 170
a <- data.frame(x = 170)
result <- predict(relation, a)
print(round(result, digit = 2))

# Plot the chart
#abline() <- to adds one or more straight lines through the current plot
plot(y, x, col="blue", main="Height & Weight Regression", abline(lm(x~y)), cex=1.3, pch=16, xlab="Weight in Kg", ylab="Height in cm")

###################################################################
# Example case study
data <- read.csv("C:/Users/USER/OneDrive/Documents/Undergraduate/Year 2/SEM 2/Introduction to Data Science/Database/Week 7_income.data.csv")

data.train <- data[1:398,]
data.test <- data[399:498,]

#apply the lm() function
relation <- lm(happiness ~ income, data = data.train)
print(relation)

#prediction
a <- data.frame(x = data.test$income)
colnames(a) <- "income"
result <- predict(relation, a)
print(result)

#plot the chart
plot(data.test$income, data.test$happiness, col="red", abline(lm(happiness~income, data=data.train)), cex = 1.3, pch = 16, xlab = "income", ylab = "happiness")

#performance measurement
actuals_preds <- data.frame(cbind(actuals=data.test$happiness, predicteds=result))

#make actuals_predicteds dataframe
correlation_accuracy <- cor(actuals_preds)
head(actuals_preds)

#measuring errors in MAPE
mape <- mean(abs((actuals_preds$predicteds - actuals_preds$actuals)) / actuals_preds$actuals) * 100 
paste("The error - MAPE is:", round(mape, digit = 2), "%")
