# Identifying outliers - Boxplot
data<-c(30,24,26,28,29,28,27,26,32,34,13,15,14,31,29,28,24,25,30,34,35,27,30,34,44,48)

boxplot(data, main = "Boxplot")

#Calculate first & third quartile value
first_q <- quantile(data, 0.25)
third_q <- quantile(data, 0.75)

#Calculate the interquartile range [IQR]
iqr <- IQR(data)

#Calculate upper & lower extreme
le <- first_q - 1.5 * iqr
ue <- third_q + 1.5 * iqr

###################################################################
# Handling outlier - using Boxplot [Drop the value]
data_new <- data
data_new <- data_new[!data_new < le]
data_new <- data_new[!data_new > ue]
print(data_new)

# Replace value with mean
data_mean <- data
avg <- round(mean(data_mean))
data_mean[data_mean < le] <- avg
data_mean[data_mean > ue] <- avg
print(data_mean)

# Replace value with ue & le
data_extreme <- data
data_extreme[data_extreme < le] <- le
data_extreme[data_extreme > ue] <- ue
print(data_extreme)

# Visualize the treated data
boxplot(data_new, main = "Boxplot")
boxplot(data_mean, main = "Boxplot")
boxplot(data_extreme, main = "Boxplot")

###################################################################
# Handling imbalance data
install.packages("ROSE")
library(ROSE)

#import dataset containing 2 files; train (100 obs.) and test (250 obs.)
data(hacide)

#check the structure of hacide.train – containing 3 variables
str(hacide.train)

#check the cls variable in hacide.train
table(hacide.train$cls)

#chek the propotion of cls variable in hacide.train
prop.table(table(hacide.train$cls))

###################################################################
# Oversampling method [ovun.sample() function used]
data_balanced_over <- ovun.sample(cls ~ ., data = hacide.train, method = "over",N = 1960)$data

#check the data and proportion
table(data_balanced_over$cls)
prop.table(table(data_balanced_over$cls)) 

###################################################################
# Undersampling method [ovun.sample() function used]
data_balanced_under <- ovun.sample(cls ~ ., data = hacide.train, method = "under", N = 40, seed = 1)$data

#check the data and proportion
table(data_balanced_under$cls)
prop.table(table(data_balanced_under$cls)) 

###################################################################
# Feature selection
library(lattice)

#load data
data(environmental)
data <- environmental
head(data)

#correlation matrix of data, round each value to 2 decimal places
corr_mat <- round(cor(data), 2)
head(corr_mat)

#reduce te size of the correlation matrix
install.packages("reshape2")
library(reshape2)

melted_corr_mat <- melt(corr_mat)
head(melted_corr_mat)

#plotting the correlation heatmap
library(ggplot2)

ggplot(data = melted_corr_mat, aes(x=Var1, y=Var2, fill=value)) +
  geom_tile() + geom_text(aes(Var2, Var1, label = value), color = "black", size = 4)

###################################################################
# Scaling - Normalization
install.packages("caret")
library(caret)

# Create data
data <- c(244,753,596,645,874,141,639,465,999,654)

# normalizing data
trans_data <- preProcess(as.data.frame(data), method=c("range"))
norm_data <- predict(trans_data, as.data.frame(data))
print(norm_data)

# Standardization
# Create data
data <- c(244,753,596,645,874,141,639,465,999,654)

# standardizing data
std_data <- as.data.frame(scale(data)) 
print(std_data)
