# K-Means
#before clustering
x = c(5.1,4.9,4.7,4.6,5,5.4,4.6,5,4.4,4.9,5.3,5.2,5.2,5.3,4.4,4.5,4.5,4.4)
y = c(3.5,3,3.2,3.1,3.6,3.9,3.4,3.4,2.9,3.1,3.6,3.8,3.6,3.7,3.1,3.6,3.5,3.2)
plot(x, y, col = "blue", pch = 19, cex = 2)

#after clustering
dataFrame <- data.frame(x, y)
kmeansObj <- kmeans(dataFrame, centers = 3)
plot(x, y, col = kmeansObj$cluster, pch = 19, cex = 2)



#rest of the code explanation refer to quiz 3