# Activity 1
#Import different type of data file
library(readxl)

uforeport <- read_excel("C:/Users/USER/OneDrive/Documents/Undergraduate/Year 2/SEM 2/Introduction to Data Science/Database/Lab 7_uforeport.xls")

titanic <- read.csv("C:/Users/USER/OneDrive/Documents/Undergraduate/Year 2/SEM 2/Introduction to Data Science/Database/Lab 7_titanic.csv")

#Clean the data
dim(uforeport)
uforeport_cleaned = na.omit(uforeport)
dim(uforeport_cleaned)

dim(titanic)
titanic_cleaned = na.omit(titanic)
dim(titanic_cleaned)

# Activity 2
#To display the structure of data
str(uforeport)
str(uforeport_cleaned)

str(titanic)
str(titanic_cleaned)

#To display the summary of the data
summary(uforeport)
summary(uforeport_cleaned)

summary(titanic)
summary(titanic_cleaned)

#To display the number of row and column of the data
nrow(uforeport)
ncol(uforeport)
nrow(uforeport_cleaned)
ncol(uforeport_cleaned)

nrow(titanic)
ncol(titanic)
nrow(titanic_cleaned)
ncol(titanic_cleaned)

#To get the column name of data
library(dplyr)
colnames(uforeport_cleaned)

colnames(titanic_cleaned)

#To searching the data
titanic_filter = titanic_cleaned %>% filter(embark_town == 'Cherbourg', alive == 'yes', class == 'Third')

#To export the data to csv
library(xlsx)
write.csv(titanic_filter, "titanic_filter.csv")