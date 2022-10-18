#Logical Operations
a = TRUE
b = FALSE
print(a&b)
print(a&!b)
print(a|b)
print(!a|b)

c = c(TRUE, FALSE)
d = c(FALSE, FALSE)
print(c&&d)
print(c||d)

v <- c(3, 1.5, TRUE)
t <- c(4, 2.1, FALSE)
print(!v)
print(!t)
print(v&t)
print(v|t)
print(v&&t)
print(v||t)

#Relational Operations
x = 5
y = 9
z = 2+3
print(x>y)
print(x<y)
print(x<=z)
print(y>=z)
print(x==z)
print(x!=y)

l <- c(2, 5.5, 6, 9)
m <- c(8, 2.5, 14, 9)
print(l>m)
print(l<m)
print(l<=m)
print(l>=m)
print(l==m)
print(l!=m)

#String Construction
e <- 'Start and end with single quote'
print(e)
f <- "Start and end with duoble quotes"
print(f)
g <- "Single quote ' in between duoble quotes"
print(g)
h <- 'Double quotes " in between single quote'
print(h)
#i <- 'Mixed quotes"
#print(i)
#j <- 'Single quote ' inside single quote'
#print(j)
#k <- "Double quotes " inside double quotes"
#print(k)

#Escape Characters
str <- "We are the so-called \"Vikings\", from the north."
cat(str)
str <- "We are the so-called \\Vikings\\, from the north."
cat(str)
str <- "We are the \r so-called Vikings \n from the north."
cat(str)
str <- "\t We are the so-called Vikings from the north."
cat(str)

#Concatenating Strings
o <- "Hello"
p <- 'How'
q <- "are you?"
print(paste(o,p,q))
print(paste(o,p,q, sep = "-"))
print(paste(o,p,q, sep = " ", collapse = " "))

#Formatting numbers & strings
# Total number of digits displayed. Last digit rounded off.
result <- format(23.123456789, digits = 9)
print(result)
# Display numbers in scientific notation.
result <- format(c(6, 13.14521, scientific = TRUE))
print(result)
# The minimum number of digits to the right of the decimal point.
result <- format(23.47, nsmall = 5)
print(result)
# Format treats everything as a string.
result <- format(6)
print(result)
# Numbers are padded with blank in the beginning for width.
result <- format(13.7, width = 6)
print(result)
# Left justify strings.
result <- format("Hello", width = 8, justify = "l")
print(result)
# Justify string with center.
result <- format("Hello", width = 8, justify = "c")
print(result)
# Right justify strings.
result <- format("Hello", width = 8, justify = "r")
print(result)

#Counting number of characters in a string
str <- ("Count the number of characters")
result <- nchar(str)
print(result)
# Installing and importing package (only done once)
install.packages("stringr")
library(stringr)
# Calculating length of string
str_length(str)

#Changing the case
result <- toupper("Changing To Upper")
print(result)
result <- tolower("Changing To Lower")
print(result)

#Extracting parts of a string
# Extract characters from 5th to 7th position.
result <- substring("Extract", 5, 7)
print(result)
# Extract characters in 1st position.
result <- substr("Learn Code Tech", 1, 1)
print(result)

