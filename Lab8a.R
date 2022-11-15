# Using sample datasets from library
data()

data(mtcars)
print(head(mtcars, 10))

input <- mtcars[, c('mpg', 'cyl')]
print(head(input))

######################################################################
demo(graphics)
demo(image)

######################################################################
x <- c(21, 62, 10, 53)
labels <- c("London", "New York", "Singapore", "Mumbai")

pie(x, labels)

######################################################################
pie(x, labels, main="City pie chart", col=rainbow(length(x)))

######################################################################
piepercent <- round(100*x/sum(x), 1)
pie(x, labels=piepercent, main="City pie chart", col=rainbow(length(x)))
legend("topright", c("London", "New York", "Singapore", "Mumbai"), cex=0.8, fill=rainbow(length(x)))

######################################################################
H <- c(7, 12, 28, 3, 41)
M <- c("Mar","Apr","May","Jun","Jul")
barplot(H,names.arg=M,xlab="Month",ylab="Revenue",col="blue",
        main="Revenue chart",border="red")
