# Create Relationship Model & get the Coefficients
# The predictor vector.
x <- c(151, 174, 138, 186, 128, 136, 179, 163, 152, 131)
# The response vector.
y <- c(63, 81, 56, 91, 47, 57, 76, 72, 62, 48)
# Apply the lm() function.
relation <- lm(y~x)
print(relation)

# Get the Summary of the Relationship
print(summary(relation))

# Predicting single value
# Find weight of a person with height 170.
a <- data.frame(x = 170)
result <- predict(relation,a)
print(result)

# Predicting multiple value prediction
b <- data.frame(x=c(151, 174,170))
result <- predict(relation,b)
print(result)

# Visualize the Regression Graphically
# Plot the chart.
plot(y,x,col = "blue",main = "Height & Weight Regression",
     abline(lm(x~y)),cex = 1.3,pch = 16,xlab = "Weight in Kg",ylab =
       "Height in cm")
# OR
scatter.smooth(y,x,col = "blue",main = "Height & Weight")

###################################################################
# Creating linear regression with built-in dataset [Create model, summary and visualize]
x=cars$speed
y=cars$dist

model1 <- lm(y~x)
print(model1)
print(summary(model1))

plot(y,x,main = "Distance & Speed",abline(lm(speed~dist, data=cars)),xlab = "Distance",ylab = "Speed")

scatter.smooth(y,x, main="Dist ~ Speed",xlab = "Distance",ylab = "Speed")

# OR

model1 <- lm(speed~dist, data=cars)
print(model1)
print(summary(model1))

plot(y=cars$speed,x=cars$dist,main = "Distance & Speed", abline(lm(speed~dist, data=cars)),xlab = "Distance",ylab = "Speed")

scatter.smooth(y=cars$speed,x=cars$dist, main="Dist ~ Speed",xlab = "Distance",ylab = "Speed")

# Predicting new values
x=cars$speed
y=cars$dist

model1 <- lm(y~x)
newspeed <- data.frame(x=c(26, 27,28))
result <- predict(model1,newspeed)
print(result)

###################################################################
# K-NN Classifier
# Loading package
library(e1071)
library(caTools)
library(class)

# Loading data
data(iris)
head(iris)

# Splitting data into train and test data
# Splitting data into train and test data
split <- sample.split(iris, SplitRatio = 0.7)
train_cl <- subset(iris, split == "TRUE")
test_cl <- subset(iris, split == "FALSE")

# Feature Scaling
train_scale <- scale(train_cl[, 1:4])
test_scale <- scale(test_cl[, 1:4])

# Splitting data into train and test data
# Fitting KNN Model to training dataset
classifier_knn <- knn(train = train_scale,
                      test = test_scale,
                      cl = train_cl$Species,
                      k = 1)
print(classifier_knn)

# Evaluating the Model
# Confusion Matrix
cm <- table(test_cl$Species, classifier_knn)
print(cm)

# Calculate out of Sample error
misClassError <- mean(classifier_knn != test_cl$Species)
print(paste('Accuracy =', 1-misClassError))

# Choosing the K value
# K = 3
classifier_knn <- knn(train = train_scale,
                      test = test_scale,
                      cl = train_cl$Species,
                      k = 3)
misClassError <- mean(classifier_knn != test_cl$Species)
print(paste('Accuracy =', 1-misClassError))

# K = 5
classifier_knn <- knn(train = train_scale,
                      test = test_scale,
                      cl = train_cl$Species,
                      k = 5)
misClassError <- mean(classifier_knn != test_cl$Species)
print(paste('Accuracy =', 1-misClassError))

# K = 7
classifier_knn <- knn(train = train_scale,
                      test = test_scale,
                      cl = train_cl$Species,
                      k = 7)
misClassError <- mean(classifier_knn != test_cl$Species)
print(paste('Accuracy =', 1-misClassError))

# K = 7
classifier_knn <- knn(train = train_scale,
                      test = test_scale,
                      cl = train_cl$Species,
                      k = 7)
misClassError <- mean(classifier_knn != test_cl$Species)
print(paste('Accuracy =', 1-misClassError))

# K = 19
classifier_knn <- knn(train = train_scale,
                      test = test_scale,
                      cl = train_cl$Species,
                      k = 19)
misClassError <- mean(classifier_knn != test_cl$Species)
print(paste('Accuracy =', 1-misClassError))
