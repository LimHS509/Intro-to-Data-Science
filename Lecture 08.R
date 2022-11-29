# Import external dataset 
heart.data <- read.csv("C:/Users/USER/OneDrive/Documents/Undergraduate/Year 2/SEM 2/Introduction to Data Science/Database/Week 8_heart.data.csv")

head(heart.data)
str(heart.data)

# Model the MLR (machine learning R)
heart.disease.lm <- lm(heart.disease ~ biking + smoking, data = heart.data)

# Investigate the properties of the model
summary(heart.disease.lm)

# Split data into train and test sets
data.train <- heart.data[1:398,]
data.test <- heart.data[399:498,]

# Modelling
heart.disease.lm <- lm(heart.disease ~ biking + smoking, data = data.train)
summary(heart.disease.lm)

# Prediction
a <- data.frame(biking=data.test$biking, smoking=data.test$smoking)
result <- predict(heart.disease.lm, a)

# Performance measurement
actuals_preds <- data.frame(cbind(actuals=data.test$heart.disease, predicteds=result))
correlation_accuracy <- cor(actuals_preds)
head(actuals_preds)
mape <- mean(abs(actuals_preds$predicteds - actuals_preds$actuals) / actuals_preds$actual) * 100
paste("The error - MAPE is:", round(mape, digit=2), "%")

###################################################################
# CART for Classification prediction [predicting iris species]
#import library
install.packages("ggformula")
install.packages("tree")
install.packages("dplyr")
library(ggformula)
library(tree)
library(dplyr)

#explore the dataset
head(iris)
tail(iris)

#visualize the data
gf_point(Sepal.Length ~ Sepal.Width, data = iris, color = ~ Species) %>% gf_labs(title = " Figure 1: Scatterplot of Iris Data")

#create the classification tree
treeall <- tree(Species ~ ., data = iris)

#visualize the tree
plot(treeall)
text(treeall, cex = 0.5)

#create a summary table (called a confusion matrix)
#output is the class instead of the probability
tree.pred <- predict(treeall, iris, type = "class")
table(tree.pred, iris$Species)

###################################################################
# CART for Regression prediction [Hitters dataset]
#import library
install.packages("ISLR")
install.packages("rpart")
install.packages("rpart.plot")
library(ISLR) #contains Hitters dataset
library(rpart) #for fitting decision trees
library(rpart.plot) #for plotting decision trees

#view dataset
data(Hitters)
head(Hitters)

#checking for NAs and removal
sum(is.na(Hitters$Salary))
df_hitters <- Hitters
df_hitters <- na.omit(df_hitters)

#divide the data into train and test sets, only 13 observations for testing
df_train <- df_hitters[1:250,]
df_test <- df_hitters[252:263,]

#build the initial tree
tree <-rpart(Salary ~ Years + HmRun, data = df_train, control = rpart.control(cp = .001))

#view result
printcp(tree)

#identify best cp value to use
best <- tree$cptable[which.min(tree$cptable[, "xerror"]), "CP"]

#product a pruned tree based on the best cp value
pruned_tree1 <- prune(tree, cp = best)

#plot the pruned tree
prp(pruned_tree1,
    faclen = 0, #use full names for factor labels
    extra = 1, #display number of obs. for each terminal node
    roundint = F, #don't round to integers in output
    digits = 5) #display 5 decimal places in output

#prediction result
res <- predict(pruned_tree1,newdata = df_test[c("Years","HmRun")])
print(res)

#getting the actual Salary values
act <- Hitters$Salary[250:263]

#calculating the errors
MAE.tree1 <- mean(abs(res-act),na.rm=T)# remove missing values
print(MAE.tree1)
