# Understand correlation analyses
x = c(1, 2, 3, 4, 5, 6, 7)
y = c(1, 3, 6, 2, 7, 4, 5)

result = cor(x, y, method = "pearson")

cat("Pearson coorelation coefficient is:", result)

############################################################
result = cor.test(x, y, method = "pearson")
print(result)

############################################################
#Sinstall.packages("corrplot")
#install.packages("RColorBrewer")
library(corrplot)
library(RColorBrewer)

M <- cor(mtcars)

corrplot(M, type="upper")
corrplot(M, type="upper", order="hclust")
corrplot(M, type="upper", order="hclust", col=brewer.pal(n=8, name="RdYlBu"))

############################################################
# Plotting Correlation with Heatmap
#install.packages("lattice")
library(lattice)

data <- environmental
head(data)

corr_mat <- round(cor(data), 2)
head(corr_mat
     )
dist <- as.dist((1-corr_mat)/2)

hc <- hclust(dist)
corr_mat <- corr_mat[hc$order, hc$order]

#install.packages("reshape2")
library(reshape2)

melted_corr_mat <- melt(corr_mat)
head(melted_corr_mat)

############################################################
#install.packages("ggplot2")
library(ggplot2)

ggplot(data = melted_corr_mat, aes(x=Var1, y=Var2, fill=value)) + geom_tile() + geom_text(aes(Var2, Var1, label=value), color="White", size=4)

############################################################
#install.packages("heatmaply")
library(heatmaply)
heatmaply_cor(x=cor(data), xlab="Features", ylab="Features", k_col=2, k_row=2)

############################################################
#install.packages("ggcorrplot")
library(ggcorrplot)

ggcorrplot::ggcorrplot(cor(data))

############################################################
mydata <- c(244, 753, 596, 645, 874, 141, 639, 465, 999, 654)

scale_data <- log(mydata)
print(scale_data)

############################################################
scale_data2 <- as.data.frame(scale(mydata))
print(scale_data2)

############################################################
#install.packages("caret")
library(caret)

minmax <- preProcess(as.data.frame(mydata), method=c("range"))
scale_data3 <- predict(minmax, as.data.frame(mydata))
print(scale_data3)

############################################################
summary(data)
summary(scale_data)
summary(scale_data2)
summary(scale_data3)

