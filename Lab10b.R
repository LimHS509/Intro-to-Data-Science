# Activity 1
data(Theoph)
head(Theoph)

x = Theoph$Wt #independent variables
y = Theoph$Dose #dependent variables

relation <- lm(y ~ x)
print(relation)
print(summary(relation))

#plot visualize
plot(x, y, main = "The dose of theophyline administered orally to the subject (mg/kg)", xlab = "Wt", ylab = "Dose")

scatter.smooth(x, y, main = "Dose ~ Wt", xlab = "Wt", ylab = "Dose")

#predict new value
newWt <- data.frame(x = c(90, 95, 100))
result <- predict(relation, newWt)
print(result)

# Activity 2
data(ChickWeight)
head(ChickWeight)

# Loading package
library(e1071)
library(caTools)
library(class)

#Splitting data into train and test
split <- sample.split(ChickWeight, SplitRatio = 0.7)
train_data <- subset(ChickWeight, split == "TRUE")
test_data <- subset(ChickWeight, split == "TRUE")


#Feature scaling
train_scale <- scale(train_data[, 1:4])
test_scale <- scale(test_data[, 1:4])

#Fitting KNN model to training dataset
classifier_knn <- knn(train = train_scale,
                      test = test_scale,
                      data = train_data$Diet,
                      k = 1)
print(classifier_knn)

#confusion matrix
cm <- table(test_data$Diet, classifier_knn)
print(cm)

#Calculate out of sample error
misClassError <- mean(classifier_knn != test_data$Diet)
print(paste("Accuracy =", 1 - misClassError))
