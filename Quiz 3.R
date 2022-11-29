data("iris")
#str <- structure
str(iris)

#ggplot2 <- for visualization
#install.packages("ggplot2")
library(ggplot2)

#Building a plot
ggplot(iris, aes(Petal.Length, Petal.Width)) + geom_point(aes(col=Species), size=4)
ggplot(iris, aes(Sepal.Length, Sepal.Width)) + geom_point(aes(col=Species), size=4)

#c(1, 2, 3, 4) <- column 1-4 and ignore column 5
iris.new <- iris[, c(1, 2, 3, 4)]

#"Species <- column 5
iris.class <- iris[, "Species"]

head(iris.new)
head(iris.class)

#3 <- volume of k / clusters = 3
result <- kmeans(iris.new, 3)
result$size
result$centers

#-5 <- take the rest column except 5th column
iris_2 <- iris[, -5]

#result$cluster <- outcome of kmeans algorithm
iris_2$cluster <- as.character(result$cluster)

ggplot() + geom_point(data = iris_2,
                      mapping =aes(x = Petal.Width,
                                  y = Petal.Length,
                                  colour = cluster)) +
  geom_point(mapping = aes_string(x = result$centers[, "Petal.Width"],
                                  y = result$centers[, "Petal.Length"],
                                  label = 1:3),
             color = "black", size = 4) +
  theme_light()

table(result$cluster, iris.class)

correct_classified = 36 + 47 + 50
wrong_classified = 3 + 14
acc = round(correct_classified / 150 * 100, digits = 2)
print(paste("Total number of correctly classified instances are:", correct_classified))
print(paste("Total number of wrong classified instance are:", wrong_classified))
print(paste("The K-Means model's accuracy is:", acc))

#install.packages("cluster")
#cluster <- clustering algorithms
library(cluster)
#install.packages("factoextra")
#factoextra <- clustering algorithms & visualization
library(factoextra)

#create plot of number of clusters vs total within sum of squares
#fviz_nbclust <- determine the value of k
fviz_nbclust(df, kmeans, method = "wss")

