# Vector construction
v <- 5:13
print(v)
v <- 6.6:12.6
print(v)
v <- 3.8:11.4
print(v)
print(seq(5, 9, by = 0.4))
s <- c('apple', 'red', 5, TRUE)
print(s)

# Accessing Vector Elements
t <- c("Sun", "Mon", "Tue", "Wed", "Thurs", "Fri", "Sat")
u <- t[c(2,3,6)]
print(u)
v <- t[c(TRUE,FALSE,FALSE,FALSE,FALSE,TRUE,FALSE)]
print(v)
x <- t[c(-2,-5)]
print(x)
y <- t[c(0,0,0,0,0,0,1)]
print(y)

# Vector Manipulation
v1 <- c(3,8,4,5,0,11)
v2 <- c(4,11,0,8,1,2)
add.result <- v1 + v2
print(add.result)
sub.result <- v1 - v2
print(sub.result)
multi.result <- v1 * v2
print(multi.result)
divi.result <- v1/v2
print(divi.result)

# Vector Element Recycling
v1 <- c(3,8,4,5,0,11)
v2 <- c(4,11)
add.result <- v1 + v2
print(add.result)
sub.result <- v1 - v2
print(sub.result)

# Vector Element Sorting
v <- c(3,8,4,5,0,11,-9,304)
sort.result <- sort(v)
print(sort.result)
revsort.result <- sort(v, decreasing = TRUE)
print(revsort.result)
v <- c("Red","Blue","Yellow","Violer")
sort.result <- sort(v)
print(sort.result)
revsort.result <- sort(v, decreasing = TRUE)
print(revsort.result)

# List Construction
list_data <- list("Red", "Green", c(21,32,11), TRUE, 51.23, 119.1)
print(list_data)
list_data <- list(c("Jan","Feb","Mar"), list("Green",12.3))
names(list_data) <- c("1st Quarter", "A Inner list")
print(list_data)

# Accessing List Elements
list_data <- list(c("Jan", "Feb", "Mar"), list("green", 12.3))
names(list_data) <- c("1st_Quarter", "A_Inner_list")
print(list_data[1])
print(list_data[2])
print(list_data$A_Inner_list)
print(which(list_data$'1st_Quarter' == "Feb"))

# List Manipulation
list_data <- list(c("Jan", "Feb", "Mar"), list("green", 12.3))
names(list_data) <- c("1st_Quarter", "A_Inner_list")
list_data[3] <- "New_elemet"
print(list_data[3])
list_data <- NULL
print(list_data[3])
list_data[2] <- "updated_element"
print(list_data[2])

