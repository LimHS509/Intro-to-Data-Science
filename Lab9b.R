# Activity 1
data(ToothGrowth)

ToothGrowthdose <- as.factor(ToothGrowth$dose)
head(ToothGrowth)

df <- ToothGrowth[, -2]
corr_mat <- round(cor(df),2)
head(corr_mat)

#Visualize Correlation Matrix using Correlogram
library(corrplot)
library(RColorBrewer)

corrplot(corr_mat, type="upper")

#Plotting Correlation with Heatmap
library(lattice)
library(reshape2)

melted_corr_mat <- melt(corr_mat)
head(melted_corr_mat)

#Correlation Heatmap using ggplot2
library(ggplot2)

ggplot(data = melted_corr_mat, aes(x=Var1, y=Var2, fill=value)) + geom_tile() + geom_text(aes(Var2, Var1, label = value), color = "white", size = 4)

# Activity 2
scaled_data <- log(mtcars)
print(scaled_data)

scaled_data2 <- as.data.frame(scale(mtcars))
print(scaled_data2)

library(caret)

minmax <- preProcess(as.data.frame(mtcars), method=c("range"))
scaled_data3 <- predict(minmax, as.data.frame(mtcars))
print(scaled_data3)

summary(mtcars)
summary(scaled_data)
summary(scaled_data2)
summary(scaled_data3)
