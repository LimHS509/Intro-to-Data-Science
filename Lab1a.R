#My first program in R Programming

myString <- "Hello, World!"
print(myString)

name <- readline(prompt="Enter name: ")
age <- readline(prompt= "Enter age: ")
#convert charater in to numeric
age <- as.numeric(age)
print(paste("Hi", name, "this year you are", age, "years old."))
