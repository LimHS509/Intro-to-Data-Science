# Activity 1
df1 <- data.frame(
  name = c("Anastasia", "Dima", "Michael", "Matthew", "Laura", "Kelvin", "Jonas"),
  score = c(12.5, 9.0, 16.5, 12.0, 9.0, 8.0, 19.0),
  attempts = c(1, 3, 2, 3, 2, 1, 2)
)

# Activity 2
#Add a 'qualify' column
df1$qualify <- c("yes", "no", "yes", "no", "no", "no", "yes")

# Activity 3
#Create a new data frame
df2 <- data.frame(
 name = ("Emily"),
 score = (14.5),
 attempts = (1),
 qualify = ("yes")
)

#Bind the two data frame
df <- rbind(df1, df2)

# Activity 4
#Display the structure
str(df)

#Display the summary
summary(df)

#Display the rows and column
ncol(df)
nrow(df)
