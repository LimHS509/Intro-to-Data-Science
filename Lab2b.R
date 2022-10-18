# Activity 1
weight <- readline(prompt = "Enter weight in kg: ")
height <- readline(prompt = "Enter height in m: ")
weight <- as.numeric(weight)
height <- as.numeric(height)
BMI = weight /(height*height)
e <- "Underweight" <= 18.4
f <- "Normal"<=24.9
g <- "Overweight"<=39.9
h <- "Obese">=40.0
x <- BMI == g 
print(x)

# Activity 2
string1 <- readline(prompt = "Enter string 1: ")
string2 <- readline(prompt = "Enter string 2: ")
z <- "This program compare 2 string. Both inputs are similar: "
y <- string1 == string2
print(paste(z,y))

# Activity 3
a <- "Hi,"
b <- toupper("chalers . a")
c <- tolower("VERIFICATION CODE HAS BEEN SENT TO")
d <- "014 - 1234 8752"
print(paste(a,b,c, str_replace(d, "1234", "****"), sep=" ", collapse=" ",))

